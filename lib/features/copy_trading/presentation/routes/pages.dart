import 'package:get/route_manager.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/dashboard_base.dart';

List<GetPage> copyTradingPages = [
  GetPage(
    name: CopyTradingRoutes.dashBoardBase,
    page: () => const DashboardBase(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
