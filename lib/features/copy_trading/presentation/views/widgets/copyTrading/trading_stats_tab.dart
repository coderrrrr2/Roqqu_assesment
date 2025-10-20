import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/trading_pairs_section.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/trading_stats.dart';
import 'package:roqqu_assesment/shared/widgets/shared_widgets.dart';

class TradingStatsTab extends StatelessWidget {
  final ProTrader trader;
  const TradingStatsTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TradingStatisticsSection(trader: trader),

          TradingPairsSection(trader: trader),
          addHeight(24.h),
        ],
      ),
    );
  }
}
