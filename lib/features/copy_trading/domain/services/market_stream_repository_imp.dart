import 'dart:async';
import 'dart:developer';
import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_ticker_dto.dart';

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

  @override
  Stream<TickerDTO> tickerStream(String symbol) {
    final path = '/ws/${symbol.toLowerCase()}@miniTicker';
    final raw = _client.connectSingle(path);
    return raw.map((e) {
      log('ticker triggered $e');
      return TickerDTO.fromJson(e);
    });
  }
}
