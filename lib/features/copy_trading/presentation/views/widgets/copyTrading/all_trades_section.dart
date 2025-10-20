import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/all_trades_tab_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/coin_section.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/shared_widgets.dart';

class AllTradesSection extends HookWidget {
  final ProTrader trader;
  final bool showHeader;
  const AllTradesSection({
    super.key,
    required this.trader,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = useState(0);
    final pageController = usePageController(initialPage: 0);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTabBar(
            selectedIndex: selectedTabIndex.value,
            onTabChanged: (index) {
              selectedTabIndex.value = index;
            },
          ),

          Container(
            constraints: BoxConstraints(
              maxHeight: getScreenHeight(context) * 0.51,
            ),

            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                selectedTabIndex.value = index;
              },
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 160.h),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CoinSection(trader: trader);
                  },
                  itemCount: trader.tradingHistory.length,
                ),
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 160.h),

                  physics: const AlwaysScrollableScrollPhysics(),

                  itemBuilder: (context, index) {
                    return CoinSection(trader: trader);
                  },
                  itemCount: trader.tradingHistory.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
