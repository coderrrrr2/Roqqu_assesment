import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsAssetAllocationWidget extends StatelessWidget {
  final String selectedPeriod;
  final ProTrader trader;
  const TraderDetailsAssetAllocationWidget({
    super.key,
    required this.selectedPeriod,
    required this.trader,
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
    final topAsset = trader.assetAllocations.entries.first;

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
                text: 'Assets allocation',
                fontSize: 14.sp,
                variant: TextVariant.interRegular,
              ),
              periodDropdown(),
            ],
          ),
          addHeight(24.h),
          Center(
            child: SizedBox(
              width: 200.w,
              height: 200.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 4,
                      centerSpaceRadius: 70.r,
                      sections:
                          trader.assetAllocations.entries.map((entry) {
                            final color = AppColors.getRandomColor(
                              entry.key,
                            ); // utility to assign consistent color
                            return PieChartSectionData(
                              color: color,
                              value: entry.value,
                              title: '',
                              radius: 30.r,
                            );
                          }).toList(),
                    ),
                  ),

                  Positioned.fill(
                    child: CircularProgressIndicator(
                      value: topAsset.value / 100,
                      strokeWidth: 8.r,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.yellow,
                      ),
                      backgroundColor: AppColors.lightyYellow,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: topAsset.key),
                      AppText(text: '${topAsset.value.toStringAsFixed(2)}%'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
