import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/all_trades_tab_bar_button.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        width: 221.w,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.grey8,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.grey3, width: 1.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AllTradesTabBarButton(
                text: 'Current trades',
                isSelected: selectedIndex == 0,
                onTap: () => onTabChanged(0),
              ),
            ),
            Expanded(
              child: AllTradesTabBarButton(
                text: 'History',
                isSelected: selectedIndex == 1,
                onTap: () => onTabChanged(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
