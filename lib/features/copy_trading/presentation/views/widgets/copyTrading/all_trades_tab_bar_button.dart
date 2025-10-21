import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class AllTradesTabBarButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AllTradesTabBarButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grey8,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppText(
            text: text,
            color: AppColors.white,
            fontSize: 12.sp,
            variant: TextVariant.interBold,
          ),
        ),
      ),
    );
  }
}
