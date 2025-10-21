import 'dart:async';
import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';

import '../../../../core/network/websocket/binance_socket_client.dart';
import '../repositories/market_stream_repository.dart';

class BinanceMarketStreamRepository implements MarketStreamRepository {
  final BinanceSocketClient _client;
  BinanceMarketStreamRepository(this._client);

  @override
  Stream<TradeEventDTO> tradeStream(String symbol) {
    final path = '/ws/${symbol.toLowerCase()}@trade';
    final raw = _client.connectSingle(path);
    return raw.map((e) {
      final trade = TradeEventDTO.fromJson(e);
      return trade;
    });
  }
}
