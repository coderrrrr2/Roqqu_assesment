import 'dart:async';

import 'package:roqqu_assesment/core/network/websocket/network_state.dart';
import 'package:roqqu_assesment/core/network/websocket/socket_connection.dart';

class BinanceSocketClient {
  final Map<String, SocketConnection> _connections = {};
  final _connectionStateController =
      StreamController<Map<String, ConnectionState>>.broadcast();

  Stream<Map<String, ConnectionState>> get connectionStates =>
      _connectionStateController.stream;

  Stream<Map<String, dynamic>> connectSingle(String path) {
    if (_connections.containsKey(path)) {
      return _connections[path]!.stream;
    }

    final uri = Uri.parse('wss://stream.binance.com:9443$path');

    final isBinanceStream = path.startsWith('/ws/!') || path.contains('@');

    final connection = SocketConnection(
      uri: uri,
      onStateChange: () => _notifyStateChange(),
      autoPing: !isBinanceStream,
    );

    _connections[path] = connection;
    _notifyStateChange();

    return connection.stream;
  }

  Stream<Map<String, dynamic>> connectMultiple(List<String> streams) {
    final combinedPath = '/stream?streams=${streams.join('/')}';
    return connectSingle(combinedPath);
  }

  void closeConnection(String path) {
    final connection = _connections.remove(path);
    connection?.dispose();
    _notifyStateChange();
  }

  void closeAll() {
    for (final connection in _connections.values) {
      connection.dispose();
    }
    _connections.clear();
    _notifyStateChange();
  }

  ConnectionState? getConnectionState(String path) {
    return _connections[path]?.state;
  }

  void _notifyStateChange() {
    final states = <String, ConnectionState>{};
    for (final entry in _connections.entries) {
      states[entry.key] = entry.value.state;
    }
    if (!_connectionStateController.isClosed) {
      _connectionStateController.add(states);
    }
  }

  void dispose() {
    closeAll();
    _connectionStateController.close();
  }
}

extension BinanceStreams on BinanceSocketClient {
  Stream<Map<String, dynamic>> ticker(String symbol) {
    return connectSingle('/ws/${symbol.toLowerCase()}@ticker');
  }

  Stream<Map<String, dynamic>> trades(String symbol) {
    return connectSingle('/ws/${symbol.toLowerCase()}@trade');
  }

  Stream<Map<String, dynamic>> klines(String symbol, String interval) {
    return connectSingle('/ws/${symbol.toLowerCase()}@kline_$interval');
  }

  Stream<Map<String, dynamic>> depth(String symbol, {String? speed}) {
    final speedSuffix = speed != null ? '@${speed}ms' : '';
    return connectSingle('/ws/${symbol.toLowerCase()}@depth$speedSuffix');
  }

  Stream<Map<String, dynamic>> multiTicker(List<String> symbols) {
    final streams = symbols.map((s) => '${s.toLowerCase()}@ticker').toList();
    return connectMultiple(streams);
  }
}
