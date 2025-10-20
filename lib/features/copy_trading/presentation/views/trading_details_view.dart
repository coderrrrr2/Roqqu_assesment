import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/trading_all_trades_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/trading_chart_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/trading_copiers_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/trading_stats_tab.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/certified_badge.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/traderDetails/tabs.dart';
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
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalValue),
          child: Column(
            children: [
              addHeight(17.h),
              CopyTradingAppBar(
                title: AppStrings.tradingDetails,
                showBackButton: true,
                isBackButtonPadded: false,
              ),
              addHeight(25.h),
              traderProfile(widget.args.trader),
              addHeight(22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statItem('${widget.args.trader.tradingDays} trading days'),
                  statItem('${widget.args.trader.profitShare}% profit-share'),
                  statItem('${widget.args.trader.totalOrders} total orders'),
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
                    TradingDetailsChartTab(trader: widget.args.trader),
                    TradingStatsTab(trader: widget.args.trader),
                    TradingAllTradesTab(trader: widget.args.trader),
                    TradingCopiersTab(trader: widget.args.trader),
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
    return Row(
      children: [
        Container(
          width: 51.2.w,
          height: 51.2.w,
          decoration: BoxDecoration(
            color: Color(
              int.parse('0xFF${trader.avatarColorHex}'),
            ).withValues(alpha: 0.5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(int.parse('0xFF${trader.avatarColorHex}')),
              width: 2.r,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Center(
                child: AppText(
                  text: StringUtils.getInitials(trader.name),
                  fontSize: 16.sp,
                  variant: TextVariant.interBold,
                ),
              ),
              Positioned(
                bottom: -14.h,
                right: 3.w,
                child: SvgImage(badge, width: 18.w, height: 25.h),
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
              variant: TextVariant.encodeBold,
            ),
            addHeight(8.h),
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
