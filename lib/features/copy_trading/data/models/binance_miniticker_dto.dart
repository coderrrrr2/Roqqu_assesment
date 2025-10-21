class MiniTickerDTO {
  final String symbol;
  final double close;
  final double open;

  const MiniTickerDTO({
    required this.symbol,
    required this.close,
    required this.open,
  });

  factory MiniTickerDTO.fromJson(Map<String, dynamic> json) {
    return MiniTickerDTO(
      symbol: json['s'] as String,
      close: double.tryParse(json['c'] ?? '0') ?? 0,
      open: double.tryParse(json['o'] ?? '0') ?? 0,
    );
  }

  double get changePercent => open == 0 ? 0 : ((close - open) / open) * 100;

  bool get isUp => changePercent >= 0;

  String get formattedPrice =>
      '\$${close.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';
}
