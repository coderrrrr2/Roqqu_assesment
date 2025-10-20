import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/mock.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/app_textfield.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class MyTradersTab extends HookWidget {
  final ProTrader trader;
  const MyTradersTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.grey6,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
          border: Border.all(color: AppColors.grey3, width: 1.r),
        ),
        child: Column(
          children: [
            AppTextField(
              borderRadius: BorderRadius.circular(8.r),
              fillColor: AppColors.grey8,
              controller: searchController,
              headerTextColor: AppColors.grey,
              hintStyle: GoogleFonts.inter(
                color: AppColors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              hintText: AppStrings.searchForTraders,
              suffixWidget: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgImage(
                  searchIcon,
                  color: AppColors.grey,
                  width: 5.w,
                  height: 5.w,
                ),
              ),
            ),
            addHeight(10.h),
            ...List.generate(mockTraders.take(3).length, (index) {
              final trader = mockTraders[index];
              return _buildTradersTile(
                trader,
                index == mockTraders.take(3).length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTradersTile(ProTrader trader, [bool isLast = false]) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: Color(
                  int.parse('0xFF${trader.avatarColorHex}'),
                ).withValues(alpha: 0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(int.parse('0xFF${trader.avatarColorHex}')),
                  width: 2.r,
                ),
              ),
              child: Center(
                child: AppText(
                  text: StringUtils.getInitials(trader.name),
                  fontSize: 12.sp,
                  variant: TextVariant.interBold,
                ),
              ),
            ),
            addWidth(12.w),
            AppText(
              text: trader.name,
              fontSize: 14.sp,
              variant: TextVariant.interRegular,
              color: AppColors.grey,
            ),
            Spacer(),
            SvgImage(newProBadge, width: 30.w, height: 32.h),
          ],
        ),
        addHeight(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppStrings.totalVolume,
                  fontSize: 12.sp,
                  variant: TextVariant.interRegular,
                  color: AppColors.grey,
                ),
                addHeight(4.h),
                AppText(
                  text: StringUtils.formatToCommas(
                    trader.totalVolume.toString(),
                  ),
                  fontSize: 14.sp,
                  variant: TextVariant.encodeBold,
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: AppStrings.tradingProfit,
                  fontSize: 12.sp,
                  variant: TextVariant.interRegular,
                  color: AppColors.grey,
                ),
                addHeight(4.h),
                AppText(
                  text: StringUtils.formatToCommas(
                    trader.tradingProfit.toString(),
                  ),
                  fontSize: 14.sp,
                  variant: TextVariant.encodeBold,
                ),
              ],
            ),
          ],
        ),
        if (!isLast) ...[
          addHeight(16.h),
          divider(color: AppColors.grey3),
          addHeight(16.h),
        ],
      ],
    );
  }
}
