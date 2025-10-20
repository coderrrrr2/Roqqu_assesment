import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/bottom_button_placer.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradeSuccessViewArgs {
  final ProTrader trader;
  CopyTradeSuccessViewArgs({required this.trader});
}

class CopyTradeSuccessView extends HookWidget {
  final CopyTradeSuccessViewArgs args;
  const CopyTradeSuccessView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(successCoin, width: 92.w, height: 102.h),
                  addHeight(24.h),
                  AppText(
                    text: AppStrings.copyTradeSuccess,
                    fontSize: 16.sp,
                    color: AppColors.white,
                    variant: TextVariant.encodeBold,
                  ),
                  addHeight(15.h),
                  AppText(
                    text: AppStrings.successfullyCopied(args.trader.name),
                    fontSize: 14.sp,
                    color: AppColors.grey,
                    variant: TextVariant.interRegular,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButtonPlacer(
            onPressed: () {
              AppNavigator.pushRoute(CopyTradingRoutes.copyTradingDashboard);
            },
            text: AppStrings.goToDashBoard,
          ),
        ],
      ),
    );
  }
}
