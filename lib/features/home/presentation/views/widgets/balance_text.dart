import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/amount_display.dart';
import 'package:roqqu_assesment/shared/widgets/app_text.dart';

class AnimatedBalanceText extends StatelessWidget {
  final String amount;
  final bool isBalanceShown;

  const AnimatedBalanceText({
    super.key,
    required this.amount,
    required this.isBalanceShown,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child:
          isBalanceShown
              ? AmountDisplay(key: const ValueKey('amount'), amount: amount)
              : Center(
                key: const ValueKey('hidden'),
                child: AppText(
                  key: key,
                  text: "*******",
                  fontSize: 32.sp,
                  variant: TextVariant.encodeExtraBold,
                ),
              ),
    );
  }
}
