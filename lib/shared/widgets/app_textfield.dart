import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class AppTextField extends HookWidget {
  final EdgeInsetsGeometry padding;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final bool autoFocus;
  final bool isObscure;
  final bool isEnabled;
  final bool isGradientBorder;
  final BorderRadius? borderRadius;
  final String? header;
  final BoxConstraints? constraints;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final double? headerFontSize;
  final String hintText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? bottomPadding;
  final FontWeight? headerFontWeight;
  final Color? fillColor;
  final Color? borderColor;
  final bool isReadOnly;
  final VoidCallback? ontap;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onchanged;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final Key? textFieldKey;
  final Color? cursorColor;
  final int minLines;
  final bool? obscureText;
  final Color? headerTextColor;
  final double? borderWidth;
  final double? headerSpace;
  final bool autoCorrect;
  final Widget? headerWidget;
  final EdgeInsetsGeometry? contentPadding;
  final String? initialValue;
  final TextAlign? textAlign;

  const AppTextField({
    super.key,
    this.contentPadding,
    this.headerSpace,
    this.minLines = 1,
    this.constraints,
    this.cursorColor,
    this.textAlignVertical,
    this.autoCorrect = true,
    this.autoFocus = false,
    this.headerTextColor,
    this.isGradientBorder = false,
    this.borderWidth,
    this.maxLines,
    this.textFieldKey,
    this.borderColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0),
    this.header,

    this.borderRadius,
    this.keyboardType,
    this.isEnabled = true,
    this.headerFontSize,
    this.focusNode,
    this.hintStyle,
    this.hintText = '',
    this.suffixWidget,
    this.prefixWidget,
    this.headerFontWeight,
    this.fillColor,
    this.isReadOnly = false,
    this.ontap,
    this.bottomPadding = 10,
    this.headerWidget,
    this.validator,
    this.onchanged,
    this.inputFormatters,
    this.obscureText,
    this.initialValue,
    required this.controller,
    this.isObscure = false,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final isTextFieldShown = useState(isObscure);
    final isLargeScreen = getScreenWidth(context) > 600;

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerWidget ??
              (header != null
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        color: headerTextColor ?? AppColors.white,
                        text: header!,
                        fontSize: headerFontSize ?? 13.sp,
                        fontWeight: headerFontWeight ?? FontWeight.bold,
                      ),
                      addHeight(headerSpace ?? (isLargeScreen ? 7.sp : 15.h)),
                    ],
                  )
                  : const SizedBox.shrink()),
          Padding(
            padding: EdgeInsets.only(bottom: bottomPadding ?? 10.h),
            child: TextFormField(
              textAlign: textAlign ?? TextAlign.start,
              initialValue: initialValue,
              enabled: isEnabled,
              autofocus: autoFocus,
              autocorrect: autoCorrect,
              focusNode: focusNode,
              key: textFieldKey,
              obscureText: obscureText ?? isTextFieldShown.value,
              inputFormatters: inputFormatters,
              onChanged: onchanged,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onTap: ontap,
              readOnly: isReadOnly,
              validator: validator,
              maxLines: (obscureText ?? isTextFieldShown.value) ? 1 : maxLines,
              minLines: minLines,
              keyboardType: keyboardType,
              style: textStyle ?? const TextStyle(color: AppColors.white),
              cursorColor: cursorColor ?? AppColors.white,

              // textAlignVertical: textAlignVertical ??
              //     (isLargeScreen
              //         ? TextAlignVertical.top
              //         : TextAlignVertical.center), // Adjusts cursor alignment
              decoration: InputDecoration(
                errorMaxLines: 3,
                errorStyle: TextStyle(
                  color: Colors.red, // Customize error text color
                  fontSize: 11.sp, // Customize error text size
                  overflow: TextOverflow.visible, // Allow wrapping
                ),
                // isDense: true,
                constraints:
                    constraints ??
                    BoxConstraints(maxWidth: 345.w, minHeight: 38.h),
                contentPadding:
                    contentPadding ?? EdgeInsets.symmetric(horizontal: 10.h),
                hintText: hintText,
                prefixIcon: prefixWidget,

                suffixIcon:
                    isObscure
                        ? isTextFieldShown.value
                            ? IconButton(
                              onPressed: () {
                                isTextFieldShown.value =
                                    !isTextFieldShown.value;
                              },
                              icon: const Icon(
                                Icons.visibility,
                                color: AppColors.white,
                              ),
                            )
                            : IconButton(
                              onPressed: () {
                                isTextFieldShown.value =
                                    !isTextFieldShown.value;
                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                color: AppColors.white,
                              ),
                            )
                        : suffixWidget,

                hintStyle:
                    hintStyle ??
                    TextStyle(
                      color: Color.fromRGBO(159, 159, 162, 1.0),
                      fontWeight: FontWeight.w300,
                      fontSize: isLargeScreen ? 5.sp : 13.sp,
                    ),

                fillColor: fillColor ?? AppColors.backgroundColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.white,
                    width: borderWidth ?? 0.5,
                  ),
                  borderRadius: borderRadius ?? BorderRadius.circular(30.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.grey3,
                    width: borderWidth ?? 0.5,
                  ),
                  borderRadius: borderRadius ?? BorderRadius.circular(30.r),
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.grey3,
                    width: borderWidth ?? 0.5,
                  ),
                  borderRadius: borderRadius ?? BorderRadius.circular(30.r),
                ),
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
