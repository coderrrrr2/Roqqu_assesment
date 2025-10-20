import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/dashboard_card_data.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class DashBoardCard extends StatelessWidget {
  final DashboardCardData data;
  final Gradient gradient;
  final VoidCallback? onTap;

  const DashBoardCard({
    super.key,
    required this.data,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 118.h,
          width: 171.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: gradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor2,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgImage(data.icon, width: 13.w, height: 11.h),
                ),
              ),
              addHeight(24.h),
              AppText(
                text: data.title,
                fontSize: 12.sp,
                variant: TextVariant.encodeBold,
                color: AppColors.black,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: data.subtitle,
                    fontSize: 12.sp,
                    color: AppColors.grey6,
                    variant: TextVariant.interRegular,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black,
                    size: 14.r,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
