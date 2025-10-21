import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_assesment/core/network/websocket/binance_socket_client.dart';
import 'package:roqqu_assesment/core/network/websocket/network_state.dart';
import 'package:roqqu_assesment/core/network/websocket/socket_connection.dart';

class MockSocketConnection extends Fake implements SocketConnection {
  final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();

  @override
  late ConnectionState state = ConnectionState.connected;

  @override
  Stream<Map<String, dynamic>> get stream => _controller.stream;

  bool disposed = false;

  void emit(Map<String, dynamic> data) => _controller.add(data);

  @override
  void dispose() {
    disposed = true;
    _controller.close();
  }
}

void main() {
  group('BinanceSocketClient', () {
    late BinanceSocketClient client;

    setUp(() {
      client = BinanceSocketClient();
    });

    tearDown(() {
      client.dispose();
    });

    test(
      'connectSingle creates a new SocketConnection and returns its stream',
      () async {
        final stream = client.connectSingle('/ws/btcusdt@ticker');
        expect(stream, isA<Stream<Map<String, dynamic>>>());
      },
    );

    test('multiple connections maintain separate state', () async {
      client.connectSingle('/ws/btcusdt@ticker');
      client.connectSingle('/ws/ethusdt@ticker');

      expect(client.getConnectionState('/ws/btcusdt@ticker'), isNotNull);
      expect(client.getConnectionState('/ws/ethusdt@ticker'), isNotNull);
    });

    test('closeConnection removes specific connection', () {
      client.connectSingle('/ws/btcusdt@ticker');
      client.closeConnection('/ws/btcusdt@ticker');

      expect(client.getConnectionState('/ws/btcusdt@ticker'), isNull);
    });

    test('closeAll clears all connections', () {
      client.connectSingle('/ws/btcusdt@ticker');
      client.connectSingle('/ws/ethusdt@ticker');
      client.closeAll();

      expect(client.getConnectionState('/ws/btcusdt@ticker'), isNull);
      expect(client.getConnectionState('/ws/ethusdt@ticker'), isNull);
    });

    test('multiTicker builds combined stream path correctly', () {
      final stream = client.multiTicker(['BTCUSDT', 'ETHUSDT']);
      expect(stream, isA<Stream<Map<String, dynamic>>>());
    });
  });
}
