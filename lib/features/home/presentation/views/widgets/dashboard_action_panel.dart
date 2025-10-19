import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class DashboardActionPanel extends StatelessWidget {
  const DashboardActionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey3, width: 1.r),
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton(depositIcon, 'Deposit'),
                    _buildActionButton(buyIcon, 'Buy'),
                    _buildActionButton(withdrawIcon, 'Withdraw'),
                    _buildActionButton(sellIcon, 'Sell'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            width: 80.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            child: Center(
              child: AppText(
                variant: TextVariant.interBold,
                text: AppStrings.seeMore,
                color: AppColors.skyBlue,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgImage(
              icon,
              color: AppColors.white,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        addHeight(4.h),
        AppText(
          text: label,
          color: AppColors.grey,
          fontSize: 12.sp,
          variant: TextVariant.interRegular,
        ),
      ],
    );
  }
}
