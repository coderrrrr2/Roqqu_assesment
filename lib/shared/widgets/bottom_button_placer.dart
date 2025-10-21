import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';

class BottomButtonPlacer extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Size? buttonSize;
  final Size? maxButtonSize;
  final double? textSize;

  const BottomButtonPlacer({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.buttonSize,
    this.maxButtonSize,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.grey6,
        border: Border(
          top: BorderSide(color: borderColor ?? AppColors.grey3, width: 1.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: padding ?? EdgeInsets.all(16.w),
          child: AppButton(
            borderRadius: borderRadius ?? BorderRadius.circular(8.r),
            onPressed: onPressed,
            text: text,
            buttonSize: buttonSize,
            maxButtonSize: maxButtonSize ?? Size(double.infinity, 48.h),
            textSize: textSize,
          ),
        ),
      ),
    );
  }
}
