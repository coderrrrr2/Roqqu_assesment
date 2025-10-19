import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    required this.selectedPeriod,
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
    // tweak this value to perfectly line up the bottom axis with the left label column
    final double leftReserved = 56.w;
    final double bottomReserved = 30.h;

    // compute min/max from chartData (with a small padding)
    final dataMin = trader.chartData.reduce((a, b) => a < b ? a : b).toDouble();
    final dataMax = trader.chartData.reduce((a, b) => a > b ? a : b).toDouble();
    final minY = dataMin - 1.0;
    final maxY = dataMax + 1.0;

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
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'ROI',
                fontSize: 14.sp,
                variant: TextVariant.interRegular,
              ),
              periodDropdown(),
            ],
          ),
          addHeight(16.h),

          /// Chart
          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                clipData: FlClipData.all(),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                  getDrawingHorizontalLine:
                      (value) => FlLine(
                        color: AppColors.grey3.withValues(alpha: 0.22),
                        strokeWidth: 1,
                      ),
                ),

                /// TITLES
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: leftReserved,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        // Left label + small grey tick bar aligned into reserved area
                        final label = "${value.toInt()}%";
                        return SizedBox(
                          width: leftReserved,
                          child: Row(
                            children: [
                              // Label (left aligned inside reserved area)
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    text: label,
                                    fontSize: 10.sp,
                                    variant: TextVariant.interRegular,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                              // The short grey "tick" / bar (appears right next to label)
                              Container(
                                width: 20.w,
                                height: 1,
                                margin: EdgeInsets.only(left: 6.w),
                                color: AppColors.grey3.withValues(alpha: 0.35),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: bottomReserved,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx >= 0 && idx < trader.chartDates.length) {
                          return AppText(
                            text: trader.chartDates[idx],
                            fontSize: 10.sp,
                            variant: TextVariant.interRegular,
                            color: AppColors.grey,
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

                /// DATA LINE
                lineBarsData: [
                  LineChartBarData(
                    spots:
                        trader.chartData
                            .asMap()
                            .entries
                            .map(
                              (e) =>
                                  FlSpot(e.key.toDouble(), e.value.toDouble()),
                            )
                            .toList(),
                    isCurved: true,
                    color: AppColors.successGreen,
                    barWidth: 3.r,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.successGreen.withValues(alpha: 0.28),
                          AppColors.successGreen.withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],

                minY: minY,
                maxY: maxY,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
