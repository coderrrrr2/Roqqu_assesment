import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart' show AppStrings;
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/mock.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_dashboard_card.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/pro_trader_item.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradingDashboard extends StatelessWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CopyTradingAppBar(),
      body: CustomScrollView(
        slivers: [
          // Dashboard Cards
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalValue,
                vertical: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashBoardCard(
                    data: dashboardCards[0],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.paleSand,
                        AppColors.mintTeal,
                        AppColors.skyBlue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  addWidth(16.w),
                  DashBoardCard(
                    data: dashboardCards[1],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.lightPink,
                        AppColors.pink,
                        AppColors.pinkPurple,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  addWidth(12.w), // Space for the last card's margin
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: AppText(
                text: AppStrings.proTraders,
                fontSize: 16.sp,
                variant: TextVariant.encodeBold,
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final trader = mockTraders[index];
              return ProTraderItem(trader: trader);
            }, childCount: mockTraders.length),
          ),
        ],
      ),
    );
  }
}
