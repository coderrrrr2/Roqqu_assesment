import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/shared/widgets/app_text.dart';

class AmountDisplay extends StatelessWidget {
  final String amount;

  const AmountDisplay({super.key, required this.amount});

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
