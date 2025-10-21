import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class StayUpdatedTile extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final String noticeStatus;

  const StayUpdatedTile({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.noticeStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey3, width: 1.r),

        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFF111315),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgImage(
                    iconPath,
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 6.h,
                    right: 7.w,
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          addWidth(10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: AppText(
                          text: title,
                          color: Colors.white,
                          variant: TextVariant.encodeBold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    if (noticeStatus.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.red2,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: AppText(
                          text: noticeStatus,
                          color: AppColors.red,
                          fontSize: 12.sp,
                          variant: TextVariant.interRegular,
                        ),
                      ),
                  ],
                ),

                addHeight(6.h),
                AppText(
                  text: description,
                  color: AppColors.grey5,
                  fontSize: 12.sp,
                  variant: TextVariant.interRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
