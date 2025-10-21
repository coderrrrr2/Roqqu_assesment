import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_miniticker_dto.dart'
    show MiniTickerDTO;

void main() {
  group('MiniTickerDTO', () {
    test('should correctly parse miniTicker data', () {
      final json = {'s': 'BTCUSDT', 'c': '68000.00', 'o': '2.5'};

      final dto = MiniTickerDTO.fromJson(json);

      expect(dto.symbol, 'BTCUSDT');
      expect(dto.close, 68000.00);
      expect(dto.open, 2.5);
    });
  });
}
