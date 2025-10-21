import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/viewmodels/stream_vm.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/details_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/asset_allocation_widget.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/holding_period.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/roi_chart.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/warning_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/risk_involved_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/enter_amount_view.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';

class TradingDetailsChartTab extends ConsumerWidget {
  final ProTrader trader;
  const TradingDetailsChartTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol =
        trader.tradingPairs.isNotEmpty ? trader.tradingPairs.first : 'BTCUSDT';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ROI chart remains static (performance summary)
          TraderDetailsRoiChart(trader: trader),
          addHeight(10.h),

          AppButton(
            borderRadius: BorderRadius.circular(8.r),
            onPressed: () {
              AppAlert.showCustomBottomSheet(
                context: context,
                content: CopyTradeWarningBottomSheet(
                  onProceed: () {
                    AppAlert.showCustomBottomSheet(
                      context: context,
                      content: RisksInvolvedBottomSheet(
                        onConfirm: () {
                          AppNavigator.pushRoute(
                            CopyTradingRoutes.enterAmount,
                            arguments: EnterAmountViewArgs(trader: trader),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
            text: 'Copy trade',
            buttonSize: Size(double.infinity, 48.h),
            textSize: 16.sp,
          ),
          addHeight(10.h),

          Consumer(
            builder: (context, ref, _) {
              final trade = ref.watch(tradePriceProvider(symbol));
              final livePrice = trade.maybeWhen(
                data: (event) => event.price,
                orElse: () => null,
              );
              return TraderDetailsChart(trader: trader, livePrice: livePrice);
            },
          ),
          addHeight(5.h),
          TraderDetailsAssetAllocationWidget(
            selectedPeriod: AppStrings.selectedPeriod,
            trader: trader,
          ),
          addHeight(5.h),
          TraderDetailsHoldingPeriodWidget(trader: trader),
          addHeight(40.h),
        ],
      ),
    );
  }
}
