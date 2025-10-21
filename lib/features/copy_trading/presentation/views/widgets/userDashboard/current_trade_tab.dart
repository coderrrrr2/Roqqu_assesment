import 'package:flutter/material.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/userDashboard/trading_history_section.dart';

class CurrentTradeTab extends StatelessWidget {
  final ProTrader trader;
  const CurrentTradeTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TradingHistorySection(trader: trader, showHeader: false),
    );
  }
}
