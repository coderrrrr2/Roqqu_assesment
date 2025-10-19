class ProTrader {
  final String name;
  final String initials;
  final String avatarColorHex;
  final double roi;
  final double totalPnl;
  final int winRate;
  final double aum;
  final List<double> chartData;
  final List<String> chartDates;
  final Map<String, double> assetAllocations;
  final List<Map<String, double>> holdingPeriods;
  final int tradingDays;
  final double profitShare;
  final int totalOrders;
  final int copiers;
  final bool isCertified;
  final List<String> certifications;

  const ProTrader({
    required this.name,
    required this.initials,
    required this.avatarColorHex,
    required this.roi,
    required this.totalPnl,
    required this.winRate,
    required this.aum,
    required this.chartData,
    required this.chartDates,
    required this.assetAllocations,
    required this.holdingPeriods,
    required this.tradingDays,
    required this.profitShare,
    required this.totalOrders,
    required this.copiers,
    required this.isCertified,
    required this.certifications,
  });
}
