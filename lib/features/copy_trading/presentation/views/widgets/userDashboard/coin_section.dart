import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CoinSection extends StatelessWidget {
  final ProTrader trader;
  const CoinSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final trade = trader.tradingHistory[index];
        return section(trade);
      },
      itemCount: trader.tradingHistory.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget section(TradingHistory history) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.smallVerticalValue),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalValue,
              vertical: AppSpacing.smallVerticalValue,
            ),
            decoration: BoxDecoration(color: AppColors.grey8),
            child: Row(
              children: [
                SvgImage(bitCoinIcon, width: 20.w, height: 20.w),
                addWidth(8.w),
                Row(
                  children: [
                    AppText(
                      text: AppStrings.btc,
                      fontSize: 14.sp,
                      variant: TextVariant.interRegular,
                    ),
                    AppText(
                      text: AppStrings.tenX,
                      fontSize: 14.sp,
                      variant: TextVariant.interRegular,
                      color: AppColors.skyBlue,
                    ),
                  ],
                ),
                Spacer(),
                AppText(
                  text: '+${trader.roi} ${AppStrings.roi}',
                  fontSize: 14.sp,
                  variant: TextVariant.interBold,
                  color: AppColors.successGreen,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                _buildTile(
                  AppStrings.proTrader,
                  history.proTraderName,
                  isProTraderLine: true,
                ),
                _buildTile(
                  AppStrings.entryPrice,
                  history.entryPrice.toString(),
                ),
                _buildTile(AppStrings.exitPrice, history.exitPrice.toString()),

                _buildTile(
                  AppStrings.proTraderAmount,
                  '${history.proTraderAmount} USDT',
                ),

                _buildTile(AppStrings.entryTime, '${history.entryTime}PM'),

                _buildTile(AppStrings.exitTime, '${history.exitTime}PM'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    String header,
    String trailing, {
    bool isProTraderLine = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: header,
            fontSize: 14.sp,
            variant: TextVariant.interRegular,
          ),

          AppText(
            text: trailing,

            fontSize: 14.sp,
            variant: TextVariant.interBold,
            color: isProTraderLine ? AppColors.skyBlue : AppColors.white,
          ),
        ],
      ),
    );
  }
}
