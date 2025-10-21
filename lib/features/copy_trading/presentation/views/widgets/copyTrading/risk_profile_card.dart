import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/risk_profile.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class RiskProfileCard extends StatelessWidget {
  final RiskProfile profile;
  final bool isSelected;
  final VoidCallback onTap;

  const RiskProfileCard({
    super.key,
    required this.profile,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalValue),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.backgroundColor : AppColors.grey6,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.skyBlue : AppColors.grey3,
            width: isSelected ? 1.5.r : 1.r,
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ).copyWith(top: 16.h),
                  child: AppText(
                    text: profile.title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addHeight(8.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ).copyWith(bottom: 16.h),
                  child: AppText(
                    text: profile.description,
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    variant: TextVariant.interRegular,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Container(
                width: 27.w,
                height: 17.h,
                decoration: BoxDecoration(
                  color: AppColors.skyBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.r),
                    topRight: Radius.circular(0.r),
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(0.r),
                  ),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }
}
