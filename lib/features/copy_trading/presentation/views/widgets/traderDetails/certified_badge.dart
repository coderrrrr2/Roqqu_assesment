import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsCertifiedBadge extends StatelessWidget {
  final bool isCertified;
  final List<String> certifications;

  const TraderDetailsCertifiedBadge({
    super.key,
    required this.isCertified,
    required this.certifications,
  });

  @override
  Widget build(BuildContext context) {
    if (!isCertified) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.zero,
        ),
        border: Border.all(color: AppColors.grey3, width: 1.5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                text: 'Certified PROtrader',
                fontSize: 14.sp,
                variant: TextVariant.encodeBold,
              ),
              Spacer(),
              SvgImage(appIcon, width: 18.w, height: 18.w),
              addWidth(5.w),
              SvgImage(verified, width: 16.w, height: 16.h),
            ],
          ),
          addHeight(20.h),

          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            children:
                certifications.map((cert) {
                  final color =
                      cert.toLowerCase().contains('win')
                          ? AppColors.lightSuccessGreen
                          : AppColors.lightyYellow;

                  final textColor =
                      cert.toLowerCase().contains('win')
                          ? AppColors.successGreen
                          : AppColors.yellow;

                  final icon =
                      cert.toLowerCase().contains('risk')
                          ? yellowUpwardBar
                          : greenChart;

                  return badgeItem(icon, cert, color, textColor);
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget badgeItem(String icon, String text, Color color, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      height: 22.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgImage(icon, color: textColor),
          addWidth(6.w),
          AppText(
            text: text,
            fontSize: 12.sp,
            variant: TextVariant.interRegular,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
