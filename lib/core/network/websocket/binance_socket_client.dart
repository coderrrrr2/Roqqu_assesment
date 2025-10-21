import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceSocketClient {
  WebSocketChannel? _channel;
  StreamController<dynamic>? _controller;
  Timer? _pingTimer;
  bool _closing = false;

  Stream<dynamic> connectSingle(String path) {
    final uri = Uri.parse('wss://stream.binance.com:9443$path');

    _controller?.close();
    _controller = StreamController.broadcast(onCancel: _dispose);
    _closing = false;

    void open() {
      _channel = WebSocketChannel.connect(uri);
      _channel!.stream.listen(
        (event) => _controller?.add(jsonDecode(event)),
        onError: (e, st) => _scheduleReconnect(open),
        onDone: () {
          if (!_closing) _scheduleReconnect(open);
        },
        cancelOnError: false,
      );

      _pingTimer?.cancel();
      _pingTimer = Timer.periodic(const Duration(seconds: 15), (_) {
        try {
          _channel?.sink.add(jsonEncode({"method": "PING"}));
        } catch (_) {}
      });
    }

    open();
    return _controller!.stream;
  }

  void _scheduleReconnect(void Function() reopen) {
    _pingTimer?.cancel();
    var delay = _lastDelay = (_lastDelay * 2).clamp(1000, 30000);
    Future.delayed(Duration(milliseconds: delay), () {
      if (!_closing) reopen();
    });
  }

  int _lastDelay = 500;

  void _dispose() {
    _closing = true;
    _pingTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    _controller?.close();
    _controller = null;
    _lastDelay = 500;
  }

  void close() => _dispose();
}
