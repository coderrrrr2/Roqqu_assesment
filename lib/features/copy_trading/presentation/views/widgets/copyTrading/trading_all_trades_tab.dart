import 'package:flutter/material.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/copyTrading/all_trades_section.dart';

class TradingAllTradesTab extends StatelessWidget {
  final ProTrader trader;
  const TradingAllTradesTab({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AllTradesSection(trader: trader, showHeader: false),
    );
  }
}
