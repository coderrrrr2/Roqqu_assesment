class TickerDTO {
  final String symbol;
  final double lastPrice;
  final double priceChangePercent;

  TickerDTO({
    required this.symbol,
    required this.lastPrice,
    required this.priceChangePercent,
  });

  factory TickerDTO.fromJson(Map<String, dynamic> json) {
    final symbol = json['s'] ?? '';
    final lastPrice = double.tryParse(json['c'] ?? '0') ?? 0.0;
    final openPrice = double.tryParse(json['o'] ?? '0') ?? 0.0;

    double changePercent = 0.0;
    if (openPrice > 0) {
      changePercent = ((lastPrice - openPrice) / openPrice) * 100;
    }

    return TickerDTO(
      symbol: symbol,
      lastPrice: lastPrice,
      priceChangePercent: changePercent,
    );
  }
}
