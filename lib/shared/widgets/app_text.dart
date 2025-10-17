import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';

import '../utils/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextVariant variant;
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
  final double? height;

  const AppText({
    super.key,
    required this.text,
    this.variant = TextVariant.interRegular,
    this.style,
    this.isItalic = false,
    this.color,
    this.fontWeight,
    this.fontSize,
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
    this.decoration,
    this.decorationColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    TextStyle baseStyle = theme.textTheme.displaySmall!.copyWith(
      height: height,
      decoration: decoration,
      decorationColor: decorationColor ?? AppColors.white,
      color: color ?? Colors.white,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );

    // override with chosen variant
    switch (variant) {
      case TextVariant.encodeExtraBold:
        baseStyle = GoogleFonts.encodeSansExpanded(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w700),
        );
      case TextVariant.encodeBold:
        baseStyle = GoogleFonts.encodeSans(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w700),
        );
        break;
      case TextVariant.encodeRegular:
        baseStyle = GoogleFonts.encodeSans(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w400),
        );
        break;
      case TextVariant.encodeSemiBold:
        baseStyle = GoogleFonts.encodeSans(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w600),
        );
        break;
      case TextVariant.interRegular:
        baseStyle = GoogleFonts.inter(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w400),
        );
        break;
      case TextVariant.interMedium:
        baseStyle = GoogleFonts.inter(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w500),
        );
        break;
      case TextVariant.interLight:
        baseStyle = GoogleFonts.inter(
          textStyle: baseStyle.copyWith(fontWeight: FontWeight.w300),
        );
        break;
    }

    return Text(
      text,
      style: style ?? baseStyle,
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
