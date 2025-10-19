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
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        addWidth(6.w),
        AppText(
          text: label,
          fontSize: 12.sp,
          variant: TextVariant.interRegular,
          color: AppColors.grey,
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
          addHeight(16.h),
          SizedBox(
            height: 150.h,
            child: ScatterChart(
              ScatterChartData(
                scatterSpots:
                    trader.holdingPeriods.map((e) {
                      return ScatterSpot(e['x']!, e['y']!);
                    }).toList(),

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
                        final labels = ['1m', '24h', '5d', '15d'];
                        if (value.toInt() >= 0 &&
                            value.toInt() < labels.length) {
                          return AppText(
                            text: labels[value.toInt()],
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
                gridData: FlGridData(show: false),
                minY: 64000,
                maxY: 64400,
                minX: 0,
                maxX: 4,
              ),
            ),
          ),
          addHeight(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendItem('Profit', AppColors.successGreen),
              addWidth(24.w),
              legendItem('Loss', const Color(0xFFFF4444)),
            ],
          ),
        ],
      ),
    );
  }
}
