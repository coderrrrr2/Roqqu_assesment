import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_pg_one.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_pg_two.dart';
import 'package:roqqu_assesment/features/navigation/navigation.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradingInfoView extends HookWidget {
  const CopyTradingInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addHeight(17.h),

          CopyTradingAppBar(),
          addHeight(33.h),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 3.h,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue3,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 3.h,
                  margin: EdgeInsets.only(right: 24.w),
                  decoration: BoxDecoration(
                    color:
                        currentPage.value == 1
                            ? AppColors.skyBlue3
                            : AppColors.grey3,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ],
          ),
          // PageView
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) => currentPage.value = index,
              children: const [CopyTradingPageOne(), CopyTradingPageTwo()],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 83.h, bottom: 32.h),
            child: Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      text: AppStrings.watchHowToVideo,
                      color: AppColors.skyBlue,
                      fontSize: 16.sp,
                      variant: TextVariant.interRegular,
                    ),
                  ),
                  addHeight(16.h),
                ],
              ),
            ),
          ),
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
                    AppNavigator.pushRoute(CopyTradingRoutes.riskLevel);
                  },
                  text: AppStrings.getStarted,
                  maxButtonSize: Size(double.infinity, 48.h),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
