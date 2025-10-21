import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/copy_trade_success_view.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class ConfirmPinViewArgs {
  final ProTrader trader;
  final String amount;
  ConfirmPinViewArgs({required this.trader, required this.amount});
}

class ConfirmPinView extends HookWidget {
  final ConfirmPinViewArgs args;

  const ConfirmPinView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final pin = useState('');
    final pinLength = 6;

    void onNumberPress(String number) {
      if (pin.value.length < pinLength) {
        pin.value = pin.value + number;

        if (pin.value.length == pinLength) {
          Future.delayed(Duration(milliseconds: 300), () {
            AppNavigator.pushRoute(
              CopyTradingRoutes.copyTradeSuccess,
              arguments: CopyTradeSuccessViewArgs(trader: args.trader),
            );
          });
        }
      }
    }

    void onBackspace() {
      if (pin.value.isNotEmpty) {
        pin.value = pin.value.substring(0, pin.value.length - 1);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 24.w),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ImageAsset(pinLock, width: 32.w, height: 32.w),
            addHeight(32.h),
            AppText(
              text: AppStrings.confirmTransaction,
              fontSize: 24.sp,
              variant: TextVariant.encodeExtraBold,
              color: AppColors.white,
            ),
            addHeight(4.h),
            AppText(
              text: AppStrings.confirmPinSubtitle,
              fontSize: 14.sp,
              variant: TextVariant.interRegular,
              color: AppColors.grey,
              textAlign: TextAlign.center,
              height: 1.5,
            ),
            addHeight(48.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    border: Border.all(color: AppColors.grey3, width: 1.r),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: List.generate(pinLength, (index) {
                      bool isFilled = index < pin.value.length;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: 13.w,
                        height: 14.w,
                        decoration: BoxDecoration(
                          color: isFilled ? AppColors.white : AppColors.grey4,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
                addWidth(24.w),
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    border: Border.all(color: AppColors.grey3, width: 1.r),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: SvgImage(
                      biometrics,
                      color: AppColors.white,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
              ],
            ),
            addHeight(20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNumberRow(['1', '2', '3'], onNumberPress),
                  addHeight(17.h),
                  _buildNumberRow(['4', '5', '6'], onNumberPress),
                  addHeight(17.h),
                  _buildNumberRow(['7', '8', '9'], onNumberPress),
                  addHeight(17.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNumberButton('.', onNumberPress),
                      _buildNumberButton('0', onNumberPress),
                      _buildBackspaceButton(onBackspace),
                    ],
                  ),
                ],
              ),
            ),

            addHeight(32.h),
            GestureDetector(
              onTap: () {},
              child: AppText(
                text: AppStrings.forgotPin,
                fontSize: 14.sp,
                variant: TextVariant.interBold,
                color: AppColors.skyBlue,
              ),
            ),

            addHeight(40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberRow(List<String> numbers, Function(String) onPress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          numbers.map((number) => _buildNumberButton(number, onPress)).toList(),
    );
  }

  Widget _buildNumberButton(String number, Function(String) onPress) {
    return GestureDetector(
      onTap: () => onPress(number),
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AppText(
            text: number,
            fontSize: 16.sp,
            variant: TextVariant.encodeBold,
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(VoidCallback onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 25.w, left: 25.w),
          child: Icon(CupertinoIcons.arrow_left, color: AppColors.white),
        ),
      ),
    );
  }
}
