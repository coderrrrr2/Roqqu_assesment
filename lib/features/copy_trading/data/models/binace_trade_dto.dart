class TradeEventDTO {
  final String symbol;
  final double price;
  final int eventTime;

  TradeEventDTO({
    required this.symbol,
    required this.price,
    required this.eventTime,
  });

  factory TradeEventDTO.fromJson(Map<String, dynamic> json) {
    // trade event fields: e (eventType), E (eventTime), s (symbol), p (price)
    return TradeEventDTO(
      symbol: json['s'],
      price: double.parse(json['p']),
      eventTime: json['E'],
    );
  }
}
