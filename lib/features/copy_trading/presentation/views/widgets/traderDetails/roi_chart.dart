import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsRoiChart extends StatelessWidget {
  final ProTrader trader;
  final String selectedPeriod;

  const TraderDetailsRoiChart({
    super.key,
    required this.trader,
    this.selectedPeriod = '7 days',
  });

  Widget periodDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Row(
        children: [
          AppText(
            text: selectedPeriod,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
          ),
          addWidth(4.w),
          Icon(Icons.keyboard_arrow_down, color: AppColors.white, size: 16.sp),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double leftReserved = 45.w;
    final double bottomReserved = 30.h;

    if (trader.chartData.isEmpty || trader.chartDates.isEmpty) {
      return Container(
        height: 200.h + 70.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.grey6,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
          border: Border.all(color: AppColors.grey3, width: 1.r),
        ),
        child: const Center(child: AppText(text: 'No chart data available')),
      );
    }

    final dataMin = trader.chartData.reduce((a, b) => a < b ? a : b).toDouble();
    final dataMax = trader.chartData.reduce((a, b) => a > b ? a : b).toDouble();
    final minY = dataMin.floorToDouble() - 1.0;
    final maxY = dataMax.ceilToDouble() + 1.0;

    final double maxX = (trader.chartData.length - 1).toDouble();
    final int labelCount = trader.chartDates.length;
    final double xInterval = (labelCount > 1) ? (maxX / (labelCount - 1)) : 1.0;

    return Container(
      padding: EdgeInsets.all(16.r),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppStrings.roi,
                fontSize: 14.sp,
                variant: TextVariant.encodeBold,
              ),
              periodDropdown(),
            ],
          ),
          addHeight(16.h),

          SizedBox(
            height: 200.h,
            child: Padding(
              padding: EdgeInsets.only(right: 12.w), // Adjust 12.w as needed
              child: LineChart(
                LineChartData(
                  clipData: FlClipData(
                    top: true,
                    bottom: true,
                    left: false,
                    right: true,
                  ),
                  gridData: FlGridData(show: false),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: leftReserved,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final label = "${value.toInt()}%";
                          return SizedBox(
                            width: leftReserved,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                text: label,
                                fontSize: 12.sp,
                                variant: TextVariant.interRegular,
                                color: AppColors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      drawBelowEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: bottomReserved,
                        interval: xInterval,
                        getTitlesWidget: (value, meta) {
                          final int idx =
                              (xInterval == 0)
                                  ? value.toInt()
                                  : (value / xInterval).round();

                          if (idx >= 0 && idx < trader.chartDates.length) {
                            Alignment alignment = Alignment.center;
                            if (idx == 0) {
                              alignment = Alignment.centerLeft;
                            } else if (idx == trader.chartDates.length - 1) {
                              alignment = Alignment.centerRight;
                            }

                            return Align(
                              alignment: alignment,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: AppText(
                                  text: trader.chartDates[idx],
                                  fontSize: 12.sp,
                                  variant: TextVariant.interRegular,
                                  color: AppColors.grey,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),

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
                      curveSmoothness: 0.25,
                      color: Color(0xFF4CAF50),
                      barWidth: 2.5.r,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.successGreen.withValues(alpha: 0.4),
                            AppColors.successGreen.withValues(alpha: 0.2),

                            AppColors.successGreen.withValues(alpha: 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ],

                  minX: 0,
                  maxX: maxX,
                  minY: minY,
                  maxY: maxY,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
