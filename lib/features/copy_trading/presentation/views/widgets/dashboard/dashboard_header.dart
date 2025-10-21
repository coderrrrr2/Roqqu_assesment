import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildModeSelectionContainer(),
          Spacer(),
          SvgImage(searchIcon, width: 20.w, height: 20.w),
          addWidth(20.w),
          SvgImage(headPhonesIcon, width: 20.w, height: 20.w),
          addWidth(20.w),

          SvgImage(notificationIcon, width: 20.w, height: 20.w),
          addWidth(20.w),

          _buildCountrySelection(),
        ],
      ),
    );
  }

  Widget _buildModeSelectionContainer() {
    return Container(
      width: 108.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.04),
            offset: Offset(0, 3.h),
            blurRadius: 1.r,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.12),
            offset: Offset(0, 3.h),
            blurRadius: 8.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            text: AppStrings.crypto,
            color: AppColors.black,
            variant: TextVariant.interMedium,
            fontSize: 14.sp,
          ),
          addWidth(8.w),
          Icon(Icons.keyboard_arrow_down, color: AppColors.black, size: 16.sp),
        ],
      ),
    );
  }

  Widget _buildCountrySelection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        children: [
          ImageAsset(usFlag, width: 20.w, height: 20.w, fit: BoxFit.cover),
          addWidth(5.w),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.black,
            size: 20.sp,
            weight: 20.sp,
          ),
        ],
      ),
    );
  }
}
