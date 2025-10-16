import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool isItalic;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextDecoration? decoration;
  final TextHeightBehavior? textHeightBehavior;
  final StrutStyle? strutStyle;
  final Color? decorationColor;

  const AppText({
    super.key,
    required this.text,
    this.isItalic = false,
    this.style,

    this.decorationColor,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.strutStyle,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style:
          style ??
          theme.textTheme.displaySmall!.copyWith(
            decorationColor:
                decorationColor ?? AppColors.white, // Set the underline color

            decoration: decoration,
            color: color ?? Colors.white,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
    );
  }
}

class LeadingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const LeadingText({
    super.key,
    required this.text,
    this.fontSize = 27,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.displaySmall!.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

class TrailingText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const TrailingText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.displaySmall!.copyWith(
              fontSize: fontSize ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.w200,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
