import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/app_text.dart';
import 'package:roqqu_assesment/shared/widgets/shared_widgets.dart';

class CopyTradingBanner extends StatelessWidget {
  const CopyTradingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushRoute(CopyTradingRoutes.copyTrading);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 358.h,
        height: 112.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.skyBlue2,
              AppColors.mintTeal,
              AppColors.paleSand,
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 16.h,
                  bottom: 18.h,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppStrings.copyTrading,
                      color: AppColors.black,
                      fontSize: 16.sp,
                      variant: TextVariant.encodeBold,
                    ),
                    addHeight(5.h),
                    AppText(
                      text: AppStrings.copyTradingDiscover,

                      color: AppColors.black,
                      fontSize: 12.sp,
                      variant: TextVariant.interRegular,
                    ),
                  ],
                ),
              ),
            ),

            Column(children: [addHeight(36.h), ImageAsset(crown)]),
          ],
        ),
      ),
    );
  }
}
