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
        height: 150.h,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40.w,
                  getTitlesWidget:
                      (value, meta) => AppText(
                        text: '${(value / 1000).toInt()}k',
                        fontSize: 10.sp,
                        variant: TextVariant.interRegular,
                        color: AppColors.grey,
                      ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final dates = [
                      '03-23',
                      '03-24',
                      '03-25',
                      '03-26',
                      '03-27',
                      '03-28',
                    ];
                    if (value.toInt() >= 0 && value.toInt() < dates.length) {
                      return AppText(
                        text: dates[value.toInt()],
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
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                            64000 + (e.value - 120) * 100,
                          ),
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
                      AppColors.successGreen.withValues(alpha: 0.3),
                      AppColors.successGreen.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
