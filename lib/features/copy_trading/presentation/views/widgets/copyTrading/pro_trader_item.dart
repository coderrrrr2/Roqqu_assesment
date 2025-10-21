import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/shared.dart';
import 'package:roqqu_assesment/shared/utils/string_utils.dart';

class ProTraderItem extends StatelessWidget {
  final ProTrader trader;
  const ProTraderItem({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
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
                            child: SvgImage(badge, width: 14.w, height: 19.6.h),
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
                          variant: TextVariant.interMedium,
                        ),
                        addHeight(4.h),
                        Row(
                          children: [
                            SvgImage(people, width: 12.w, height: 12.h),
                            addWidth(4.w),
                            AppText(
                              text: '500',
                              fontSize: 12.sp,
                              variant: TextVariant.interMedium,
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
                        color: AppColors.backgroundColor3,
                        border: Border.all(color: AppColors.grey3, width: 1.r),

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
                addHeight(5.h),
                divider(color: AppColors.grey3),
                addHeight(10.h),

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
                                  '${AppStrings.dollarSign}${trader.totalPnl}',
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
                      child: SizedBox(
                        width: 120.w,
                        height: 80.h,
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
                                color: AppColors.successGreen,
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.successGreen.withAlpha(100),
                                      AppColors.successGreen..withAlpha(400),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                dotData: const FlDotData(show: false),
                                barWidth: 3.r, // Increased from 2.r to 3.r
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
