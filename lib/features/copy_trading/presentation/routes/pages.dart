import 'package:get/route_manager.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trading_dashboard.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trading_info_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/dashboard_base.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/risk_selection_view.dart';

List<GetPage> copyTradingPages = [
  GetPage(
    name: CopyTradingRoutes.dashBoardBase,
    page: () => const DashboardBase(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.copyTrading,
    page: () => const CopyTradingInfoView(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.riskLevel,
    page: () => const RiskLevelSelectionView(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.copyTradingDashboard,
    page: () => const CopyTradingDashboard(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
