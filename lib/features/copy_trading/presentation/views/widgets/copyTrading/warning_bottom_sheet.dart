import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradeWarningBottomSheet extends StatefulWidget {
  final VoidCallback onProceed;

  const CopyTradeWarningBottomSheet({super.key, required this.onProceed});

  @override
  State<CopyTradeWarningBottomSheet> createState() =>
      _CopyTradeWarningBottomSheetState();
}

class _CopyTradeWarningBottomSheetState
    extends State<CopyTradeWarningBottomSheet> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.95,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.grey3, width: 1.r),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 16.h,
              right: 16.w,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8.r),
                  child: Icon(Icons.close, color: AppColors.white, size: 20.sp),
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey3,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      width: 38.w,
                      height: 5.h,
                      margin: EdgeInsets.only(top: 12.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 25.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageAsset(
                          importantMessage,
                          width: 133.w,
                          height: 96.h,
                        ),

                        addHeight(10.h),

                        AppText(
                          text: AppStrings.importantMessage,
                          fontSize: 20.sp,
                          variant: TextVariant.encodeExtraBold,
                          textAlign: TextAlign.center,
                        ),

                        addHeight(16.h),
                        AppText(
                          text: AppStrings.copyTradeWarningMessage,
                          fontSize: 14.sp,
                          variant: TextVariant.interRegular,
                          color: AppColors.grey5,
                          textAlign: TextAlign.center,
                          height: 1.5,
                        ),

                        addHeight(8.h),

                        GestureDetector(
                          onTap: () {
                            // Handle learn more action
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.learnMore,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.skyBlue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: AppStrings.aboutTheRisks,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey5,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        addHeight(40.h),

                        GestureDetector(
                          onTap: () => setState(() => isAgreed = !isAgreed),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 22.w,
                                height: 22.w,
                                margin: EdgeInsets.only(top: 2.h),
                                decoration: BoxDecoration(
                                  color:
                                      isAgreed
                                          ? AppColors.skyBlue
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                    color:
                                        isAgreed
                                            ? AppColors.skyBlue
                                            : AppColors.grey3,
                                    width: 2.r,
                                  ),
                                ),
                                child:
                                    isAgreed
                                        ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                          size: 16.sp,
                                        )
                                        : null,
                              ),
                              addWidth(12.w),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppStrings.checkBoxAgree,
                                        style: GoogleFonts.encodeSansExpanded(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppStrings.policy,
                                        style: GoogleFonts.encodeSansExpanded(
                                          fontWeight: FontWeight.w700,

                                          fontSize: 12.sp,
                                          color: AppColors.skyBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        addHeight(32.h),

                        AppButton(
                          borderRadius: BorderRadius.circular(8.r),
                          onPressed:
                              isAgreed
                                  ? () {
                                    Navigator.pop(context);
                                    widget.onProceed();
                                  }
                                  : () {},
                          text: AppStrings.proceedToCopyTrade,
                          buttonSize: Size(double.infinity, 56.h),
                          textSize: 16.sp,
                          isEnabled: isAgreed,
                        ),

                        // addHeight(16.h),

                        // // Bottom indicator
                        // Container(
                        //   width: 134.w,
                        //   height: 5.h,
                        //   decoration: BoxDecoration(
                        //     color: AppColors.white,
                        //     borderRadius: BorderRadius.circular(100.r),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
