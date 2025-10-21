import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/app_spacing.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_ticker_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/viewmodels/stream_vm.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CoinSection extends HookConsumerWidget {
  final ProTrader trader;
  const CoinSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the shared ticker data once for the entire list
    final tickersAsync = ref.watch(sharedTickerProvider);

    return tickersAsync.when(
      data: (tickers) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final trade = trader.tradingHistory[index];
            final symbol = "BTCUSDT";
            final ticker = tickers[symbol];

            return section(trade, ticker);
          },
          itemCount: trader.tradingHistory.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
      loading:
          () => ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final trade = trader.tradingHistory[index];
              return section(trade, null);
            },
            itemCount: trader.tradingHistory.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
      error:
          (e, _) => ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final trade = trader.tradingHistory[index];
              return section(trade, null);
            },
            itemCount: trader.tradingHistory.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
    );
  }

  Widget section(TradingHistory history, TickerDTO? ticker) {
    final changeColor =
        (ticker?.priceChangePercent ?? 0) >= 0
            ? AppColors.successGreen
            : AppColors.red;

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
                AppText(
                  text: 'BTCUSDT',
                  fontSize: 14.sp,
                  variant: TextVariant.interRegular,
                ),
                addWidth(8.w),
                AppText(
                  text: '${ticker?.lastPrice ?? '--'}',
                  fontSize: 14.sp,
                  variant: TextVariant.interBold,
                ),
                Spacer(),
                AppText(
                  text:
                      '${ticker?.priceChangePercent.toStringAsFixed(2) ?? '--'}%',
                  fontSize: 14.sp,
                  variant: TextVariant.interBold,
                  color: changeColor,
                ),
              ],
            ),
          ),
          // Details Section
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
        children: [
          AppText(
            text: header,
            fontSize: 14.sp,
            variant: TextVariant.interRegular,
          ),
          Spacer(),
          if (isProTraderLine) ImageAsset(avatar, width: 24.w, height: 24.w),
          addWidth(8.w),
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
