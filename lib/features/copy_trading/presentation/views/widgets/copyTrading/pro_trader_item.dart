import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/trading_details_view.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class ProTraderItem extends StatelessWidget {
  final ProTrader trader;
  const ProTraderItem({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushRoute(
          CopyTradingRoutes.tradingDetails,
          arguments: TradingDetailsViewArgs(trader: trader),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.grey3, width: 1.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.horizontalValue),
              decoration: BoxDecoration(
                color: AppColors.grey6,
                border: Border.all(color: AppColors.grey3, width: 1.r),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38.w,
                        height: 38.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(92, 138, 255, 0.14),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.lighBlue),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            Center(
                              child: AppText(
                                text: StringUtils.getInitials(trader.name),
                                fontSize: 14.4.sp,
                                variant: TextVariant.interRegular,
                              ),
                            ),
                            Positioned(
                              bottom: -10.h,
                              child: SvgImage(
                                badge,
                                width: 14.w,
                                height: 19.6.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      addWidth(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: trader.name,
                            fontSize: 14.sp,
                            variant: TextVariant.interBold,
                          ),
                          addHeight(4.h),
                          Row(
                            children: [
                              SvgImage(people, width: 12.w, height: 12.h),
                              addWidth(4.w),
                              AppText(
                                text: '500',
                                fontSize: 12.sp,
                                variant: TextVariant.interBold,
                                color: AppColors.skyBlue,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 80.w,
                        height: 32.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          border: Border.all(
                            color: AppColors.grey3,
                            width: 1.r,
                          ),

                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: AppText(
                            text: AppStrings.copy,
                            fontSize: 14.sp,
                            variant: TextVariant.interRegular,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addHeight(15.h),
                  divider(color: AppColors.grey3),
                  addHeight(15.h),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: AppStrings.roi,
                            fontSize: 12.sp,
                            variant: TextVariant.interRegular,
                            color: AppColors.grey,
                          ),
                          addHeight(4.h),
                          AppText(
                            text: '+${trader.roi}',
                            fontSize: 14.sp,
                            variant: TextVariant.encodeBold,
                            color: AppColors.successGreen,
                          ),
                          addHeight(8.h),

                          Row(
                            children: [
                              AppText(
                                text: AppStrings.totalPnl,
                                fontSize: 12.sp,
                                variant: TextVariant.interRegular,
                                color: AppColors.grey,
                              ),
                              addWidth(5.w),
                              AppText(
                                text:
                                    '${AppStrings.dollarSign}${StringUtils.formatToCommas(trader.totalPnl.toString())}',
                                fontSize: 12.sp,
                                variant: TextVariant.encodeBold,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: value,
                              alignment: Alignment.centerLeft,
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          width: 132.w,
                          height: 51.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E2631),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 4.h,
                          ),
                          child: LineChart(
                            LineChartData(
                              gridData: const FlGridData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots:
                                      trader.chartData
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => FlSpot(
                                              e.key.toDouble(),
                                              e.value.toDouble(),
                                            ),
                                          )
                                          .toList(),
                                  isCurved: true,
                                  curveSmoothness: 0.35,
                                  color: AppColors.successGreen,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.black,
                                        AppColors.successGreen.withValues(
                                          alpha: 0.3,
                                        ),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  dotData: const FlDotData(show: false),
                                  barWidth: 2.5.r,
                                ),
                              ],
                              minY: 0,
                              maxY: 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(AppSpacing.horizontalValue),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: AppStrings.winRate,
                            color: AppColors.grey,
                            fontSize: 12.sp,
                            variant: TextVariant.interRegular,
                          ),
                          addWidth(8.w),
                          AppText(
                            text: '${trader.winRate}%',
                            fontSize: 12.sp,
                            variant: TextVariant.encodeBold,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SvgImage(info),
                          addWidth(4.w),
                          AppText(
                            text: AppStrings.aum,
                            color: AppColors.grey,
                            fontSize: 12.sp,
                            variant: TextVariant.interRegular,
                          ),
                          addWidth(8.w),
                          AppText(
                            text: StringUtils.formatToCommas(
                              trader.aum.toString(),
                            ),
                            fontSize: 12.sp,
                            variant: TextVariant.encodeBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
