import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/confirm_pin_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class ConfirmTransactionViewArgs {
  final ProTrader trader;
  final String amount;
  ConfirmTransactionViewArgs({required this.trader, required this.amount});
}

class ConfirmTransactionView extends HookWidget {
  final ConfirmTransactionViewArgs args;

  const ConfirmTransactionView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final trader = args.trader;
    final amount = args.amount;
    final transactionFee = (double.parse(amount) * 0.01).toStringAsFixed(2);
    final youGet = (double.parse(amount) - double.parse(transactionFee))
        .toStringAsFixed(2);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addHeight(10.h),
          SafeArea(
            child: CopyTradingAppBar(
              title: AppStrings.confirmTransaction,
              showBackButton: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalValue,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalValue,
                vertical: AppSpacing.verticalValue,
              ),
              decoration: BoxDecoration(
                color: AppColors.grey2,
                border: Border.all(color: AppColors.grey3, width: 1.r),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey3, width: 2.r),
                    ),
                    child: ClipOval(child: ImageAsset(usFlag)),
                  ),
                  addHeight(24.h),

                  AppText(
                    text: AppStrings.copyTradingAmount,
                    fontSize: 12.sp,
                    variant: TextVariant.interRegular,
                    color: AppColors.grey,
                  ),
                  addHeight(8.h),

                  AppText(
                    text: '$amount USD',
                    fontSize: 24.sp,
                    variant: TextVariant.encodeExtraBold,
                  ),

                  addHeight(40.h),

                  _buildDetailRow(
                    AppStrings.proTrader,
                    trader.name,
                    isHeader: true,
                  ),
                  addHeight(16.h),

                  _buildDetailRow(AppStrings.whatYouGet, '$youGet USD'),
                  addHeight(5.h),

                  Divider(color: AppColors.grey3, height: 1.h),
                  addHeight(16.h),

                  _buildDetailRow(
                    AppStrings.transactionFee,
                    '$transactionFee USD',
                  ),
                ],
              ),
            ),
          ),
          Spacer(),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey6,
              border: Border(
                top: BorderSide(color: AppColors.grey3, width: 1.r),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: AppButton(
                  borderRadius: BorderRadius.circular(8.r),
                  onPressed: () {
                    AppNavigator.pushRoute(
                      CopyTradingRoutes.confirmPin,
                      arguments: ConfirmPinViewArgs(
                        trader: trader,
                        amount: amount,
                      ),
                    );
                  },
                  text: AppStrings.confirmTransaction,
                  maxButtonSize: Size(double.infinity, 48.h),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: label,
          fontSize: 12.sp,
          variant: TextVariant.interRegular,
          color: AppColors.grey,
        ),
        AppText(
          text: value,
          fontSize: 12.sp,
          variant: TextVariant.interRegular,
          color: AppColors.white,
        ),
      ],
    );
  }
}
