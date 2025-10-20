import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/constants.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/period_drop_down.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TradingStatisticsSection extends StatelessWidget {
  final ProTrader trader;
  const TradingStatisticsSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    final statistics = trader.statistics;
    return Container(
      height: 370.h,

      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: AppStrings.tradingStatistics,
                    fontSize: 14.sp,
                    variant: TextVariant.encodeBold,
                  ),
                  PeriodDropDown(),
                ],
              ),
            ),
            statsTile(
              AppStrings.proTraders,
              statistics.proTraders.toString(),
              trailingColor: AppColors.skyBlue,
            ),
            statsTile(
              AppStrings.tradingDays,
              statistics.tradingDays.toString(),
            ),
            statsTile(AppStrings.profitShare, '${statistics.profitShare}%'),
            statsTile(
              AppStrings.totalOrders,
              statistics.totalOrders.toString(),
            ),
            statsTile(
              AppStrings.averageLosses,
              '${statistics.averageLosses} USDT',
              trailingColor: AppColors.red,
            ),
            statsTile(
              AppStrings.totalCopyTrades,
              statistics.totalCopyTrades.toString(),
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget statsTile(
    String title,
    String trailing, {
    Color? trailingColor,
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalValue,
            vertical: 10.h,
          ),
          leading: SvgImage(bitCoinAnalytics, width: 32.w, height: 32.h),
          title: AppText(
            text: title,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
            color: AppColors.grey,
          ),

          trailing: AppText(
            text: trailing,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
            color: trailingColor ?? AppColors.white,
          ),
        ),
        if (!isLast) divider(color: AppColors.grey3),
      ],
    );
  }
}
