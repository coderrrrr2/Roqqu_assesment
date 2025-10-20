import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsHoldingPeriodWidget extends StatelessWidget {
  final ProTrader trader;
  const TraderDetailsHoldingPeriodWidget({super.key, required this.trader});

  Widget legendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        addWidth(8.w),
        AppText(
          text: label,
          fontSize: 14.sp,
          variant: TextVariant.interRegular,
          color: AppColors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'Holding period',
                fontSize: 14.sp,
                variant: TextVariant.interRegular,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.grey3, width: 1.r),
                ),
                child: Row(
                  children: [
                    AppText(
                      text: '7 days',
                      fontSize: 12.sp,
                      variant: TextVariant.interRegular,
                    ),
                    addWidth(4.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          addHeight(24.h),
          SizedBox(
            height: 180.h,
            child: ScatterChart(
              ScatterChartData(
                scatterSpots:
                    trader.holdingPeriods.asMap().entries.map((entry) {
                      final e = entry.value;
                      final isProfit = e['type'] == 1;
                      return ScatterSpot(
                        e['x']!,
                        e['y']!,
                        dotPainter: FlDotCirclePainter(
                          radius: 6.r,
                          color:
                              isProfit ? Color(0xFF4CAF50) : Color(0xFFFF4444),
                        ),
                      );
                    }).toList(),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 45.w,
                      interval: 100,
                      getTitlesWidget:
                          (value, meta) => Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: AppText(
                              text: '${(value / 1000).toInt()}k',
                              fontSize: 11.sp,
                              variant: TextVariant.interRegular,
                              color: AppColors.grey.withValues(alpha: 0.7),
                            ),
                          ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.h,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final labels = ['1m', '24h', '5d', '15d'];
                        final idx = value.toInt();
                        if (idx >= 0 && idx < labels.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: AppText(
                              text: labels[idx],
                              fontSize: 11.sp,
                              variant: TextVariant.interRegular,
                              color: AppColors.grey.withValues(alpha: 0.7),
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
                clipData: FlClipData.all(),

                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                scatterTouchData: ScatterTouchData(enabled: false),
                minY: 64000 - 100, // add padding
                maxY: 64400 + 90,
                minX: -0.2,
                maxX: 3.2,
              ),
            ),
          ),
          addHeight(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendItem('Profit', Color(0xFF4CAF50)),
              addWidth(32.w),
              legendItem('Loss', Color(0xFFFF4444)),
            ],
          ),
        ],
      ),
    );
  }
}
