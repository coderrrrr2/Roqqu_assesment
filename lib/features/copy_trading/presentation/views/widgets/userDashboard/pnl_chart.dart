import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/period_drop_down.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class UserDashboardPnlChart extends StatelessWidget {
  final ProTrader trader;
  final String selectedPeriod;

  const UserDashboardPnlChart({
    super.key,
    required this.trader,
    required this.selectedPeriod,
  });

  @override
  Widget build(BuildContext context) {
    final double leftReserved = 45.w;
    final double bottomReserved = 30.h;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: AppStrings.copyTradingPnl,
                fontSize: 14.sp,
                variant: TextVariant.encodeBold,
              ),
              PeriodDropDown(),
            ],
          ),
          addHeight(16.h),

          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                clipData: FlClipData.all(),
                gridData: FlGridData(show: false),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: leftReserved,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final label = "${value.toInt()}K";
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
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: bottomReserved,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx >= 0 && idx < trader.chartDates.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: AppText(
                              text: trader.chartDates[idx],
                              fontSize: 12.sp,
                              variant: TextVariant.interRegular,
                              color: AppColors.grey,
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
                              (e) =>
                                  FlSpot(e.key.toDouble(), e.value.toDouble()),
                            )
                            .toList(),
                    isCurved: true,
                    curveSmoothness: 0.4,
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
