import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/balance_text.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_copy_trading_banner.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_action_panel.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/stay_updated_tile.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeContainer extends HookWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isBalanceShown = useState(true);
    final controller = usePageController();
    return Container(
      constraints: BoxConstraints(minHeight: 0.7.sh),

      margin: EdgeInsets.only(top: 24.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalValue,
          vertical: AppSpacing.largeVerticalValue,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: AppStrings.balance,
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  variant: TextVariant.interRegular,
                ),
                addWidth(8.w),
                SvgImage(
                  visibilityEye,
                  onTap: () {
                    isBalanceShown.value = !isBalanceShown.value;
                  },
                  color: AppColors.grey,
                ),
              ],
            ),
            addHeight(16.h),
            AnimatedBalanceText(
              amount: "£0.00",
              isBalanceShown: isBalanceShown.value,
            ),
            addHeight(24.h),

            DashboardActionPanel(),
            addHeight(32.h),

            CopyTradingBanner(),
            Padding(
              padding: EdgeInsets.only(top: 32.h, bottom: 15.h),
              child: AppText(
                text: AppStrings.stayUpdated,
                color: AppColors.grey5,
                fontSize: 14.sp,
                variant: TextVariant.encodeBold,
              ),
            ),
            SizedBox(
              height: 74.h,
              child: PageView.builder(
                controller: controller,
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  final item = tiles[index];
                  return StayUpdatedTile(
                    title: item['title']!,
                    description: item['description']!,
                    iconPath: item['iconPath']!,
                    noticeStatus: item['noticeStatus']!,
                  );
                },
              ),
            ),

            addHeight(10.h),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: tiles.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey.shade600,
                  dotHeight: 6,
                  dotWidth: 6,
                  spacing: 6,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.h, bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: AppStrings.listedCoins,
                    color: AppColors.grey5,
                    fontSize: 14.sp,
                    variant: TextVariant.encodeBold,
                  ),
                  AppText(
                    text: AppStrings.seeAll,
                    variant: TextVariant.interBold,
                    color: AppColors.skyBlue,
                    fontSize: 12.sp,
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
