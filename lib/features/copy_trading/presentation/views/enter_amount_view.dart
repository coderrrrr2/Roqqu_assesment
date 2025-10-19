import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/confirm_transaction_view.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/app_textfield.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class EnterAmountViewArgs {
  final ProTrader trader;

  EnterAmountViewArgs({required this.trader});
}

class EnterAmountView extends HookWidget {
  final EnterAmountViewArgs args;

  const EnterAmountView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final selectedCurrency = useState('USD');
    final trader = args.trader;

    return AppColumn(
      children: [
        AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: AppText(
            text: AppStrings.enterAmount,
            fontSize: 16.sp,
            variant: TextVariant.interBold,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: [
                  ImageAsset(usFlag, width: 24.w, height: 24.w),
                  addWidth(4.w),
                  AppText(
                    text: selectedCurrency.value,
                    fontSize: 14.sp,
                    variant: TextVariant.interBold,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
        addHeight(97.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              constraints: BoxConstraints(maxWidth: 100.w),
              controller: amountController,
              bottomPadding: 0,
              contentPadding: EdgeInsets.only(bottom: -10.h),
              borderColor: AppColors.backgroundColor,
              textStyle: GoogleFonts.encodeSansExpanded(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              hintText: '0',

              hintStyle: GoogleFonts.encodeSansCondensed(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: AppText(
                text: selectedCurrency.value,
                fontSize: 40.sp,
                variant: TextVariant.encodeExtraBold,
              ),
            ),
          ],
        ),
        addHeight(32.h),

        Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalValue,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey2,
              border: Border.all(color: AppColors.grey3, width: 1.r),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: AppText(
              text: AppStrings.transactionFeeDisplay,
              fontSize: 14.sp,
              variant: TextVariant.encodeExtraRegular,
              color: AppColors.white,
            ),
          ),
        ),
        addHeight(24.h),

        AppText(
          text: AppStrings.transactionFeeDisplay,
          fontSize: 14.sp,
          variant: TextVariant.interRegular,
          color: AppColors.grey2,
        ),
        addHeight(104.h),

        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalValue,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.grey2,
            border: Border.all(color: AppColors.grey3, width: 1.r),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppStrings.usdBalance,
                    fontSize: 12.sp,
                    variant: TextVariant.interRegular,
                    color: AppColors.grey,
                  ),
                  addHeight(4.h),
                  AppText(
                    text: '\$240.73',
                    fontSize: 16.sp,
                    variant: TextVariant.encodeBold,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  amountController.text = '240.73';
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey8,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.grey3, width: 1.r),
                  ),
                  child: AppText(
                    text: AppStrings.useMax,
                    fontSize: 12.sp,
                    variant: TextVariant.interBold,
                  ),
                ),
              ),
            ],
          ),
        ),

        Spacer(),
        AppButton(
          borderRadius: BorderRadius.circular(8.r),
          onPressed: () {
            if (amountController.text.isNotEmpty) {
              AppNavigator.pushRoute(
                CopyTradingRoutes.confirmTransaction,
                arguments: ConfirmTransactionViewArgs(
                  trader: trader,
                  amount: amountController.text,
                ),
              );
            }
          },
          text: AppStrings.continues,

          textSize: 16.sp,
        ),

        addHeight(10.h),
      ],
    );
  }
}
