import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/risk_profile.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/copy_trading_app_bar.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/risk_profile_card.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class RiskLevelSelectionView extends HookWidget {
  const RiskLevelSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);

    final List<RiskProfile> riskProfiles = [
      RiskProfile(
        title: "Conservative profile",
        description:
            "Conservative profile involves stable returns from proven strategies with minimal volatility.",
      ),
      RiskProfile(
        title: "Steady growth profile",
        description:
            "Steady growth involves balanced gains with moderate fluctuations in strategy performance.",
      ),
      RiskProfile(
        title: "Exponential growth profile",
        description:
            "It has potentials for significant gains or losses due to aggressive trading and market exposure.",
      ),
    ];

    return Scaffold(
      appBar: CopyTradingAppBar(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addHeight(42.h),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalValue,
            ),
            child: AppText(
              text: AppStrings.riskLevelTitle,
              fontSize: 24.sp,
              variant: TextVariant.encodeExtraBold,
            ),
          ),
          addHeight(8.h),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalValue,
            ),
            child: AppText(
              text: AppStrings.riskLevelSubtitle,
              fontSize: 14.sp,
              color: AppColors.grey,
              variant: TextVariant.interRegular,
            ),
          ),

          addHeight(32.h),

          Expanded(
            child: ListView.separated(
              itemCount: riskProfiles.length,
              separatorBuilder: (context, index) => addHeight(24.h),
              itemBuilder: (context, index) {
                final profile = riskProfiles[index];
                return RiskProfileCard(
                  profile: profile,
                  isSelected: selectedIndex.value == index,
                  onTap: () {
                    selectedIndex.value = index;
                  },
                );
              },
            ),
          ),

          // Footer Container with Button
          Container(
            width: double.infinity,
            height: 112.h,
            decoration: BoxDecoration(
              color: AppColors.grey6,
              border: Border(
                top: BorderSide(color: AppColors.grey3, width: 1.r),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: AppButton(
                  borderRadius: BorderRadius.circular(8.r),
                  onPressed: () {
                    AppNavigator.pushRoute(
                      CopyTradingRoutes.copyTradingDashboard,
                    );
                  },
                  text: AppStrings.proceed,
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
