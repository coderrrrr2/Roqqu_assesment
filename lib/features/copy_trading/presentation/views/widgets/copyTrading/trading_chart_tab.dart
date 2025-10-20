import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/roi_chart.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/enter_amount_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/warning_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/risk_involved_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/asset_allocation_widget.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/details_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/holding_period.dart';

class TradingDetailsChartTab extends StatelessWidget {
  final ProTrader trader;
  const TradingDetailsChartTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Add this
        children: [
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

          TraderDetailsChart(trader: trader),
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
