import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_ticker_dto.dart';

abstract class MarketStreamRepository {
  Stream<TradeEventDTO> tradeStream(String symbol);
  Stream<TickerDTO> tickerStream(String symbol);
}
