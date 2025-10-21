import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class PeriodDropDown extends StatelessWidget {
  final String selectedPeriod;
  const PeriodDropDown({super.key, this.selectedPeriod = '7 days'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey8,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Row(
        children: [
          AppText(
            text: selectedPeriod,
            fontSize: 14.sp,
            variant: TextVariant.interRegular,
          ),
          addWidth(4.w),
          Icon(Icons.keyboard_arrow_down, color: AppColors.white, size: 16.sp),
        ],
      ),
    );
  }
}
