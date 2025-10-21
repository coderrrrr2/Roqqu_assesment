import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
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
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        // Subtle scale + fade animation
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child:
          isBalanceShown
              ? _AmountDisplay(key: const ValueKey('amount'), amount: amount)
              : const _HiddenDisplay(key: ValueKey('hidden')),
    );
  }
}

class _AmountDisplay extends StatelessWidget {
  final String amount;

  const _AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final parts = amount.split('.');
    final whole = parts[0];
    final decimal = parts.length > 1 ? '.${parts[1]}' : '.00';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      key: key,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        AppText(
          text: whole,
          fontSize: 36.sp,
          variant: TextVariant.encodeExtraBold,
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: AppText(
            text: decimal,
            fontSize: 20.sp,
            variant: TextVariant.encodeBold,
          ),
        ),
      ],
    );
  }
}

class _HiddenDisplay extends StatelessWidget {
  const _HiddenDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        key: key,
        text: "*******",
        fontSize: 32.sp,
        variant: TextVariant.encodeExtraBold,
      ),
    );
  }
}
