import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/viewmodels/stream_vm.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/pnl_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/trading_history_section.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class ChartTab extends ConsumerWidget {
  final ProTrader trader;
  const ChartTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol =
        trader.tradingPairs.isNotEmpty ? trader.tradingPairs.first : 'BTCUSDT';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Add this
        children: [
          Consumer(
            builder: (context, ref, _) {
              final trade = ref.watch(tradePriceProvider(symbol));
              final livePrice = trade.maybeWhen(
                data: (event) => event.price,
                orElse: () => null,
              );
              return UserDashboardPnlChart(
                trader: trader,
                livePrice: livePrice,
                selectedPeriod: AppStrings.selectedPeriod,
              );
            },
          ),
          addHeight(5.h),
          TradingHistorySection(trader: trader, showHeader: false),
        ],
      ),
    );
  }
}
