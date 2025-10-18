class ProTrader {
  final String name;
  final String initials;
  final String avatarColorHex;
  final double roi; // Return on Investment (e.g., 120.42)
  final double totalPnl; // Total Profit and Loss
  final int winRate; // Percentage (e.g., 100)
  final double aum; // Assets Under Management
  final List<double> chartData; // Mock data points for the line chart

  ProTrader({
    required this.name,
    required this.initials,
    required this.avatarColorHex,
    required this.roi,
    required this.totalPnl,
    required this.winRate,
    required this.aum,
    required this.chartData,
  });
}
