import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/risk_item.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class RisksInvolvedBottomSheet extends StatefulWidget {
  final VoidCallback onConfirm;

  const RisksInvolvedBottomSheet({super.key, required this.onConfirm});

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => RisksInvolvedBottomSheet(onConfirm: onConfirm),
    );
  }

  @override
  State<RisksInvolvedBottomSheet> createState() =>
      _RisksInvolvedBottomSheetState();
}

class _RisksInvolvedBottomSheetState extends State<RisksInvolvedBottomSheet> {
  final Map<String, bool> _expandedSections = {};

  final List<RiskItem> _riskItems = [
    RiskItem(
      title: AppStrings.marketRisks,
      description: AppStrings.marketRisksDescription,
    ),
    RiskItem(
      title: AppStrings.dependencyOnOthers,
      description: AppStrings.dependencyOnOthersDescription,
    ),
    RiskItem(
      title: AppStrings.mismatchedRiskProfiles,
      description: AppStrings.mismatchedRiskProfilesDescription,
    ),
    RiskItem(
      title: AppStrings.controlAndUnderstanding,
      description: AppStrings.controlAndUnderstandingDescription,
    ),
    RiskItem(
      title: AppStrings.emotionalDecisions,
      description: AppStrings.emotionalDecisionsDescription,
    ),
    RiskItem(
      title: AppStrings.costsInvolved,
      description: AppStrings.costsInvolvedDescription,
    ),
    RiskItem(
      title: AppStrings.diversify,
      description: AppStrings.diversifyDescription,
    ),
    RiskItem(
      title: AppStrings.executionRisks,
      description: AppStrings.executionRisksDescription,
    ),
    RiskItem(
      title: AppStrings.copyTradingInvestmentsComplex,
      description: AppStrings.copyTradingInvestmentsComplexDescription,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.96,
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey3, width: 1.r),

        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
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

          Column(
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
                padding: EdgeInsets.fromLTRB(24.w, 48.h, 24.w, 25.h),
                child: Column(
                  children: [
                    AppText(
                      text: AppStrings.risksInvolvedInCopyTrading,
                      fontSize: 20.sp,
                      variant: TextVariant.encodeExtraBold,
                      textAlign: TextAlign.center,
                    ),
                    addHeight(12.h),
                    AppText(
                      text: AppStrings.risksInvolvedSubtitle,
                      fontSize: 14.sp,
                      variant: TextVariant.interRegular,
                      color: AppColors.grey,
                      textAlign: TextAlign.center,
                      height: 1.5,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.horizontalValue,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey2,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.grey3, width: 1.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        children:
                            _riskItems.map((item) {
                              final isExpanded =
                                  _expandedSections[item.title] ?? false;

                              return Theme(
                                data: Theme.of(
                                  context,
                                ).copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  backgroundColor: AppColors.grey2,
                                  collapsedBackgroundColor: AppColors.grey2,
                                  tilePadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 4.h,
                                  ),
                                  childrenPadding: EdgeInsets.fromLTRB(
                                    16.w,
                                    0,
                                    16.w,
                                    12.h,
                                  ),
                                  title: AppText(
                                    text: item.title,
                                    fontSize: 14.sp,
                                    variant: TextVariant.encodeBold,
                                  ),
                                  trailing: Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.white,
                                    size: 24.sp,
                                  ),
                                  onExpansionChanged: (expanded) {
                                    setState(() {
                                      _expandedSections[item.title] = expanded;
                                    });
                                  },
                                  children: [
                                    AppText(
                                      text: item.description,
                                      fontSize: 14.sp,
                                      variant: TextVariant.interRegular,
                                      color: AppColors.grey,
                                      height: 1.5,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 40.h),
                child: Column(
                  children: [
                    AppButton(
                      borderRadius: BorderRadius.circular(8.r),
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onConfirm();
                      },
                      text: AppStrings.iHaveReadTheRisks,
                      buttonSize: Size(double.infinity, 56.h),
                      textSize: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
