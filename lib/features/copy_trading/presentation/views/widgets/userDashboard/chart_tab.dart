import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/pnl_chart.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/trading_history_section.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class ChartTab extends StatelessWidget {
  final ProTrader trader;
  const ChartTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Add this
        children: [
          UserDashboardPnlChart(
            trader: trader,
            selectedPeriod: AppStrings.selectedPeriod,
          ),
          addHeight(5.h),
          TradingHistorySection(trader: trader, showHeader: false),
        ],
      ),
    );
  }
}
