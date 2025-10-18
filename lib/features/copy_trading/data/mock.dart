import 'package:roqqu_assesment/core/constants/strings.dart' show AppStrings;
import 'package:roqqu_assesment/features/copy_trading/data/models/dashboard_card_data.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/shared.dart';

final List<DashboardCardData> dashboardCards = [
  DashboardCardData(
    title: AppStrings.myDashboard,
    subtitle: AppStrings.viewTrades,
    icon: dashBoardIcon,
  ),
  DashboardCardData(
    title: AppStrings.becomeProTrader,
    subtitle: AppStrings.applyNow,
    icon: proTraderIcon,
  ),
];

final List<ProTrader> mockTraders = [
  ProTrader(
    name: "Jay isisou",
    initials: "JI",
    avatarColorHex: "4CAF50", // Green/Lime
    roi: 120.42,
    totalPnl: 38667.29,
    winRate: 100,
    aum: 38667.29,
    chartData: [0, 50, 10, 80, 20, 90, 40, 100],
  ),
  ProTrader(
    name: "Laura okobi",
    initials: "LO",
    avatarColorHex: "FF9800", // Orange
    roi: 120.42,
    totalPnl: 38667.29,
    winRate: 100,
    aum: 38667.29,
    chartData: [100, 30, 70, 0, 50, 60, 20, 90],
  ),
  ProTrader(
    name: "BTC master",
    initials: "BM",
    avatarColorHex: "2196F3", // Blue
    roi: 120.42,
    totalPnl: 38667.29,
    winRate: 100,
    aum: 38667.29,
    chartData: [50, 10, 80, 40, 100, 20, 90, 70],
  ),
];
