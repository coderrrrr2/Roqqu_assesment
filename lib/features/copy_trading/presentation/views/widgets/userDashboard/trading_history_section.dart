import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/period_drop_down.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/coin_section.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TradingHistorySection extends StatelessWidget {
  final ProTrader trader;
  final bool showHeader;
  const TradingHistorySection({
    super.key,
    required this.trader,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showHeader)
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: AppStrings.copyTradingPnl,
                    fontSize: 14.sp,
                    variant: TextVariant.encodeBold,
                  ),
                  PeriodDropDown(),
                ],
              ),
            ),
          if (!showHeader) addHeight(10.h),
          ...List.generate(
            trader.tradingHistory.length,
            (index) => CoinSection(trader: trader),
          ),
        ],
      ),
    );
  }
}
