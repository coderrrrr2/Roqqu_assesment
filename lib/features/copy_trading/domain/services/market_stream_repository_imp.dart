import 'dart:async';
import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_miniticker_dto.dart';
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
      return TickerDTO.fromJson(e);
    });
  }

  @override
  Stream<MiniTickerDTO> allMiniTickersStream() {
    const path = '/ws/!miniTicker@arr';
    final rawStream = _client.connectSingle(path);

    return rawStream.asyncExpand((event) async* {
      if (event is List) {
        for (final item in event.values) {
          try {
            yield MiniTickerDTO.fromJson(item);
          } catch (e) {
            // Ignore malformed entries
          }
        }
      } else if (event['data'] is List) {
        for (final item in event['data']) {
          yield MiniTickerDTO.fromJson(item);
        }
      }
    });
  }
}
