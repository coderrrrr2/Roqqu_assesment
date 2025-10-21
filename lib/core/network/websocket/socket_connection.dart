import 'dart:async';

import 'package:roqqu_assesment/core/network/websocket/network_state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class SocketConnection {
  final Uri uri;
  final VoidCallback onStateChange;

  final _controller = StreamController<Map<String, dynamic>>.broadcast();
  WebSocketChannel? _channel;
  Timer? _pingTimer;
  Timer? _reconnectTimer;
  StreamSubscription? _channelSubscription;

  bool _disposed = false;
  int _reconnectAttempts = 0;
  int _reconnectDelay = 1000; // Start at 1 second
  ConnectionState _state = ConnectionState.disconnected;

  static const _maxReconnectDelay = 30000; // 30 seconds max
  static const _maxReconnectAttempts = 50; // Very high limit
  static const _pingInterval = Duration(seconds: 15);
  static const _connectionTimeout = Duration(seconds: 10);

  SocketConnection({required this.uri, required this.onStateChange}) {
    _connect();
  }

  Stream<Map<String, dynamic>> get stream => _controller.stream;
  ConnectionState get state => _state;

  void _setState(ConnectionState newState) {
    if (_state != newState) {
      _state = newState;
      onStateChange();
    }
  }

  void _connect() {
    if (_disposed) return;

    _setState(
      _reconnectAttempts > 0
          ? ConnectionState.reconnecting
          : ConnectionState.connecting,
    );

    try {
      _channel = WebSocketChannel.connect(uri);

      // Set up connection timeout
      Timer(_connectionTimeout, () {
        if (_state == ConnectionState.connecting ||
            _state == ConnectionState.reconnecting) {
          debugPrint('[$uri] Connection timeout');
          _handleError('Connection timeout');
        }
      });

      _channelSubscription = _channel!.stream.listen(
        _onMessage,
        onError: _handleError,
        onDone: _onDone,
        cancelOnError: false,
      );

      _startPingTimer();
    } catch (e, stackTrace) {
      debugPrint('[$uri] Connection error: $e');
      debugPrint('Stack trace: $stackTrace');
      _handleError(e);
    }
  }

  void _onMessage(dynamic message) {
    // Successfully received message - connection is healthy
    if (_state != ConnectionState.connected) {
      _setState(ConnectionState.connected);
      _reconnectAttempts = 0;
      _reconnectDelay = 1000; // Reset backoff
      debugPrint('[$uri] Connected successfully');
    }

    try {
      final decoded = jsonDecode(message);
      if (decoded is Map<String, dynamic>) {
        // Filter out ping/pong messages
        if (decoded['method'] != null) return;

        if (!_controller.isClosed) {
          _controller.add(decoded);
        }
      }
    } catch (e) {
      debugPrint('[$uri] JSON decode error: $e');
    }
  }

  void _handleError(dynamic error) {
    if (_disposed) return;

    debugPrint('[$uri] Error: $error (attempt $_reconnectAttempts)');
    _setState(ConnectionState.error);

    if (!_controller.isClosed) {
      _controller.addError(error);
    }

    _scheduleReconnect();
  }

  void _onDone() {
    if (_disposed) return;

    debugPrint('[$uri] Connection closed');
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    if (_disposed) return;

    _cleanup();

    if (!_controller.hasListener) {
      debugPrint('[$uri] No listeners, skipping reconnect');
      _setState(ConnectionState.disconnected);
      return;
    }

    if (_reconnectAttempts >= _maxReconnectAttempts) {
      debugPrint('[$uri] Max reconnection attempts reached');
      _setState(ConnectionState.error);
      if (!_controller.isClosed) {
        _controller.addError('Max reconnection attempts reached');
      }
      return;
    }

    _reconnectAttempts++;

    final jitter =
        (_reconnectDelay *
                0.2 *
                (0.5 - (DateTime.now().millisecond % 1000) / 1000))
            .toInt();
    final delay = (_reconnectDelay + jitter).clamp(1000, _maxReconnectDelay);

    debugPrint(
      '[$uri] Reconnecting in ${delay}ms (attempt $_reconnectAttempts)',
    );

    _reconnectTimer = Timer(Duration(milliseconds: delay), _connect);

    _reconnectDelay = (_reconnectDelay * 1.5).toInt().clamp(
      1000,
      _maxReconnectDelay,
    );
  }

  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(_pingInterval, (_) {
      try {
        _channel?.sink.add(jsonEncode({'method': 'PING'}));
      } catch (e) {
        debugPrint('[$uri] Ping failed: $e');
      }
    });
  }

  void _cleanup() {
    _pingTimer?.cancel();
    _reconnectTimer?.cancel();
    _channelSubscription?.cancel();
    _channel?.sink.close();
    _channel = null;
  }

  void dispose() {
    if (_disposed) return;

    _disposed = true;
    _setState(ConnectionState.disconnected);
    _cleanup();
    _controller.close();

    debugPrint('[$uri] Disposed');
  }
}
