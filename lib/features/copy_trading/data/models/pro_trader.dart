class TradingHistory {
  final String tradingPair; // e.g., "BTCUSDT"
  final String leverage; // e.g., "10X"
  final double roi;
  final String proTraderName;
  final String proTraderInitials;
  final String proTraderAvatarColorHex;
  final double entryPrice;
  final double marketPrice;
  final String entryTime;
  final String? exitTime;
  final double? exitPrice;
  final double? proTraderAmount;
  final bool isActive; // true if trade is still open

  const TradingHistory({
    required this.tradingPair,
    required this.leverage,
    required this.roi,
    required this.proTraderName,
    required this.proTraderInitials,
    required this.proTraderAvatarColorHex,
    required this.entryPrice,
    required this.marketPrice,
    required this.entryTime,
    this.exitTime,
    this.exitPrice,
    this.proTraderAmount,
    this.isActive = true,
  });
}

class TradingStatistics {
  final int proTraders;
  final int tradingDays;
  final double profitShare; // percentage
  final int totalOrders;
  final double averageLosses;
  final int totalCopyTrades;
  final String timeframe; // e.g., "7 days"

  const TradingStatistics({
    required this.proTraders,
    required this.tradingDays,
    required this.profitShare,
    required this.totalOrders,
    required this.averageLosses,
    required this.totalCopyTrades,
    this.timeframe = "7 days",
  });
}

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
  final double totalVolume;
  final double tradingProfit;
  final int averageLosses;
  final int totalCopyTrades;
  final List<String> tradingPairs;
  final double todayPnl;
  final bool isAtLoss;
  final List<TradingHistory> tradingHistory;
  final TradingStatistics statistics;

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
    required this.totalVolume,
    required this.tradingProfit,
    required this.averageLosses,
    required this.totalCopyTrades,
    required this.tradingPairs,
    this.isAtLoss = false,
    required this.todayPnl,
    required this.tradingHistory,
    required this.statistics,
  });
}
