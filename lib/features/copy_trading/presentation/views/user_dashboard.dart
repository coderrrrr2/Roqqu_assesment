import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/chart_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/current_trade_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/my_traders_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/stat_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/tabs.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class UserDashboardViewArgs {
  final ProTrader trader;
  UserDashboardViewArgs({required this.trader});
}

class UserDashboardView extends StatefulWidget {
  final UserDashboardViewArgs args;

  const UserDashboardView({super.key, required this.args});

  @override
  State<UserDashboardView> createState() => _UserDashboardViewState();
}

class _UserDashboardViewState extends State<UserDashboardView> {
  int selectedTabIndex = 0;
  String selectedPeriod = '7 days';
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              addHeight(17.h),
              CopyTradingAppBar(
                title: AppStrings.myDashboard,
                showBackButton: true,
              ),
              addHeight(25.h),
              traderProfile(widget.args.trader),
              addHeight(20.h),

              UserDashBoardTabs(
                selectedIndex: selectedTabIndex,
                onTabSelected: (index) {
                  pageController.jumpToPage(index);
                },
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() => selectedTabIndex = index);
                  },
                  children: [
                    ChartTab(trader: widget.args.trader),
                    CurrentTradeTab(trader: widget.args.trader),
                    StatTab(trader: widget.args.trader),
                    MyTradersTab(trader: widget.args.trader),
                  ],
                ),
              ),
            ],
          ),
        ),
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
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: AppStrings.copyTradingAssets,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
          ),
          addHeight(6.h),

          AppText(
            text:
                '${AppStrings.dollarSign}${StringUtils.formatToCommas(trader.tradingProfit.toString())}',
            fontSize: 14.sp,
            variant: TextVariant.encodeBold,
          ),
          addHeight(12.h),
          divider(color: AppColors.grey3),
          addHeight(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppStrings.netProfit,
                    fontSize: 12.sp,
                    variant: TextVariant.interRegular,
                  ),
                  addHeight(6.h),

                  AppText(
                    text:
                        '${AppStrings.dollarSign}${StringUtils.formatToCommas(trader.tradingProfit.toString())}',
                    fontSize: 14.sp,
                    variant: TextVariant.encodeBold,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppStrings.todaysPnl,
                    fontSize: 12.sp,
                    variant: TextVariant.interRegular,
                  ),
                  addHeight(6.h),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgImage(upwardGreenArrow, width: 12.w, height: 12.h),
                      addWidth(8.w),
                      AppText(
                        text: trader.todayPnl.toString(),
                        fontSize: 14.sp,
                        variant: TextVariant.encodeBold,
                        color: AppColors.successGreen,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
