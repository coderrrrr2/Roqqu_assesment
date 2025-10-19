import 'package:get/route_manager.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/confirm_pin_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/confirm_transaction_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trade_success_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trading_dashboard.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trading_info_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/enter_amount_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/risk_selection_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/trading_details_view.dart';

List<GetPage> copyTradingPages = [
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
  GetPage(
    name: CopyTradingRoutes.tradingDetails,
    page:
        () => TradingDetailsView(args: Get.arguments as TradingDetailsViewArgs),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.enterAmount,
    page: () => EnterAmountView(args: Get.arguments as EnterAmountViewArgs),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.confirmPin,
    page: () => ConfirmPinView(args: Get.arguments as ConfirmPinViewArgs),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.confirmTransaction,
    page:
        () => ConfirmTransactionView(
          args: Get.arguments as ConfirmTransactionViewArgs,
        ),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: CopyTradingRoutes.copyTradeSuccess,
    page:
        () => CopyTradeSuccessView(
          args: Get.arguments as CopyTradeSuccessViewArgs,
        ),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
