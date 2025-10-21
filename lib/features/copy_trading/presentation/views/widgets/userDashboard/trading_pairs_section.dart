import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TradingPairsSection extends StatelessWidget {
  final ProTrader trader;
  const TradingPairsSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: AppText(
            text: AppStrings.tradingPairs,
            variant: TextVariant.encodeBold,
            fontSize: 12.sp,
          ),
        ),
        Wrap(
          children:
              trader.tradingPairs
                  .map((stat) => _buildTradingPairContainer(stat))
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildTradingPairContainer(String tradingPair) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey8,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey3),
      ),
      child: AppText(
        text: tradingPair,
        variant: TextVariant.interRegular,
        fontSize: 14.sp,
        color: AppColors.grey,
      ),
    );
  }
}
