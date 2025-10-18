import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/shared.dart';

class CopyTradingPageOne extends StatelessWidget {
  const CopyTradingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addHeight(24.h),
          AppText(
            text: AppStrings.copyTradingCopyProTraders,
            fontSize: 24.sp,

            variant: TextVariant.encodeExtraBold,
          ),
          addHeight(8.h),
          AppText(
            text: AppStrings.copyTradingLeverageExperts,

            color: AppColors.grey,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
            height: 1.5,
          ),
          addHeight(75.h),
          Expanded(
            child: Center(
              child: ImageAsset(doLessWinMore, width: 290.w, height: 290.h),
            ),
          ),
        ],
      ),
    );
  }
}
