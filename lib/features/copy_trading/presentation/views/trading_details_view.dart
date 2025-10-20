import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/enter_amount_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/warning_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/risk_involved_bottom_sheet.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/asset_allocation_widget.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/certified_badge.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/details_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/holding_period.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/roi_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/tabs.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TradingDetailsViewArgs {
  final ProTrader trader;
  TradingDetailsViewArgs({required this.trader});
}

class TradingDetailsView extends StatefulWidget {
  final TradingDetailsViewArgs args;

  const TradingDetailsView({super.key, required this.args});

  @override
  State<TradingDetailsView> createState() => _TradingDetailsViewState();
}

class _TradingDetailsViewState extends State<TradingDetailsView> {
  int selectedTabIndex = 0;
  String selectedPeriod = '7 days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Column(
        children: [
          addHeight(17.h),
          CopyTradingAppBar(title: 'Trading Details', showBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalValue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHeight(25.h),
                  traderProfile(widget.args.trader),
                  addHeight(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statItem(
                        '${widget.args.trader.tradingDays} trading days',
                      ),
                      statItem(
                        '${widget.args.trader.profitShare}% profit-share',
                      ),
                      statItem(
                        '${widget.args.trader.totalOrders} total orders',
                      ),
                    ],
                  ),

                  addHeight(16.h),

                  TraderDetailsCertifiedBadge(
                    isCertified: widget.args.trader.isCertified,
                    certifications: widget.args.trader.certifications,
                  ),
                  addHeight(5.h),

                  TraderDetailsTabs(
                    selectedIndex: selectedTabIndex,
                    onTabSelected: (index) {
                      setState(() => selectedTabIndex = index);
                    },
                  ),

                  TraderDetailsRoiChart(
                    trader: widget.args.trader,
                    selectedPeriod: selectedPeriod,
                  ),
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
                                    arguments: EnterAmountViewArgs(
                                      trader: widget.args.trader,
                                    ),
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

                  TraderDetailsChart(trader: widget.args.trader),
                  addHeight(5.h),

                  TraderDetailsAssetAllocationWidget(
                    selectedPeriod: selectedPeriod,
                    trader: widget.args.trader,
                  ),
                  addHeight(5.h),

                  TraderDetailsHoldingPeriodWidget(trader: widget.args.trader),
                  addHeight(40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget statItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey7,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: AppText(
        text: text,
        fontSize: 12.sp,
        variant: TextVariant.interRegular,
        color: AppColors.grey,
      ),
    );
  }

  Widget traderProfile(ProTrader trader) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(92, 138, 255, 0.14),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lighBlue, width: 2.r),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Center(
                child: AppText(
                  text: StringUtils.getInitials(trader.name),
                  fontSize: 18.sp,
                  variant: TextVariant.interBold,
                ),
              ),
              Positioned(
                bottom: -4.h,
                right: -2.w,
                child: SvgImage(badge, width: 16.w, height: 22.h),
              ),
            ],
          ),
        ),
        addWidth(12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: trader.name,
              fontSize: 18.sp,
              variant: TextVariant.interRegular,
            ),
            addHeight(4.h),
            Row(
              children: [
                SvgImage(people, width: 14.w, height: 14.h),
                addWidth(6.w),
                AppText(
                  text: '${trader.copiers} Copiers',
                  fontSize: 13.sp,
                  variant: TextVariant.interRegular,
                  color: AppColors.grey,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
