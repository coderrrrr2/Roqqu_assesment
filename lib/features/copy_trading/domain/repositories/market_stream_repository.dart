import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';

abstract class MarketStreamRepository {
  Stream<TradeEventDTO> tradeStream(String symbol);
}
