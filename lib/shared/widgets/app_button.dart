import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final Size? buttonSize;
  final Size? maxButtonSize;

  final double? textSize;
  final Color? textColor;
  final Widget? content;
  final FontWeight? fontWeight;
  final double? borderWidth;
  final bool isEnabled;
  final bool isActive;
  final bool? isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    this.borderWidth,
    this.maxButtonSize,
    this.text = "",
    this.isActive = true,
    this.content,
    this.buttonSize,
    this.textSize,
    this.textColor,
    this.fontWeight,
    this.isLoading,
    this.isEnabled = true,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final isLargeScreen = getScreenWidth(context) > 600;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(72, 59, 235, 1), // royalBlue
            Color.fromRGBO(120, 71, 225, 1), // violet
            Color.fromRGBO(221, 86, 141, 1), // rosePink
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: ElevatedButton(
        onPressed: widget.isEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: Colors.transparent,
            width: widget.borderWidth ?? 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          minimumSize:
              widget.maxButtonSize ?? (widget.buttonSize ?? Size(370.w, 40.h)),
          maximumSize: widget.maxButtonSize,
          backgroundColor: Colors.transparent, // Make background transparent
        ),
        child:
            widget.isLoading == true
                ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(color: Colors.white),
                )
                : widget.text.isNotEmpty
                ? AppText(
                  text: widget.text,
                  color:
                      widget.textColor ??
                      (widget.isEnabled ? null : Colors.white),
                  fontSize: widget.textSize ?? (isLargeScreen ? 12.sp : 15.sp),
                  fontWeight: widget.fontWeight ?? FontWeight.bold,
                )
                : widget.content,
      ),
    );
  }
}
