import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TraderDetailsTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Chart', 'Stats', 'All Trades', 'Copiers'];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.zero,
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.skyBlue : Colors.transparent,
                    width: 2.r,
                  ),
                ),
              ),
              child: AppText(
                text: tabs[index],
                fontSize: 14.sp,
                variant: TextVariant.interBold,
                color: isSelected ? AppColors.white : AppColors.grey,
              ),
            ),
          );
        }),
      ),
    );
  }
}
