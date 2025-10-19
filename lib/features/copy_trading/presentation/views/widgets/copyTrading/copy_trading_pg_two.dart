import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradingPageTwo extends StatelessWidget {
  const CopyTradingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addHeight(24.h),
          AppText(
            text: AppStrings.copyTradingDoLessWinMore,
            fontSize: 24.sp,

            variant: TextVariant.encodeExtraBold,
          ),
          addHeight(8.h),
          AppText(
            text: AppStrings.copyTradingStreamlineApproach,

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
