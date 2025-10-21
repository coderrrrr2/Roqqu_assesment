import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsChart extends StatelessWidget {
  final ProTrader trader;

  const TraderDetailsChart({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    final double leftReserved = 45.w;
    final double bottomReserved = 30.h;

    final chartData =
        trader.chartData
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), 64000 + (e.value - 120) * 100))
            .toList();

    final dataMin = chartData.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final dataMax = chartData.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final minY = dataMin - 100;
    final maxY = dataMax + 100;

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
      child: SizedBox(
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
                  interval: 100,
                  getTitlesWidget: (value, meta) {
                    return SizedBox(
                      width: leftReserved,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          text: '${(value / 1000).toInt()}k',
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
                    final dates = [
                      '03-23',
                      '03-24',
                      '03-25',
                      '03-26',
                      '03-27',
                      '03-28',
                    ];
                    final idx = value.toInt();
                    if (idx >= 0 && idx < dates.length) {
                      return Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: AppText(
                          text: dates[idx],
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
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: chartData,
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
    );
  }
}
