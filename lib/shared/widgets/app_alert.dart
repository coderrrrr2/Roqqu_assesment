import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class AppAlert {
  static void showToast(
    BuildContext passedContext, {
    required String message,
    bool isIconShown = true,
    Duration? toastDuration,
    IconData? icon,
    bool isError = false,
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    Color? color,
    Color? textColor,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!passedContext.mounted) return;

      DelightToastBar(
        snackbarDuration: toastDuration ?? const Duration(seconds: 2),
        autoDismiss: true,
        position: position,
        builder: (context) {
          return ToastCard(
            color:
                color ??
                (isError
                    ? AppColors.red
                    : const Color.fromARGB(255, 24, 24, 24)),
            leading:
                isIconShown
                    ? Icon(
                      icon ?? Icons.error,
                      size: 28,
                      color: AppColors.white,
                    )
                    : null,
            title: AppText(
              color: textColor,
              text: message,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ).show(passedContext);
    });
  }

  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true, // Dismiss when tapping outside
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: AppText(fontSize: 17.sp, text: title),
          content: AppText(fontSize: 15.sp, text: content),
          actions: [
            if (cancelText != null)
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onCancel != null) {
                    onCancel();
                  }
                },
                child: AppText(text: cancelText),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) {
                  onConfirm();
                }
              },
              child: AppText(text: confirmText ?? "Confirm"),
            ),
          ],
        );
      },
    );
  }

  static Future<void> displayAlertDialog({
    required BuildContext context,
    String? title,
    List<Widget>? actions,
    Widget? content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? onDismiss,
    bool barrierDismissible = true, // Dismiss when tapping outside
  }) async {
    final bool? result = await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.black.withValues(
        alpha: 0.5,
      ), // Change background color
      builder: (BuildContext contexts) {
        return AlertDialog(
          shadowColor: AppColors.black,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set border radius
          ),
          title: AppText(
            fontWeight: FontWeight.bold,
            text: title ?? '',
            fontSize: isLargeScreen(context) ? 15.sp : 18.sp,
          ),
          content: content,
          actions:
              actions ??
              [
                GestureDetector(
                  onTap:
                      onCancel ??
                      () {
                        Navigator.pop(contexts); // Close the popup
                      },
                  child: AppText(
                    text: cancelText ?? "Cancel",
                    color: AppColors.white,
                    fontSize: isLargeScreen(context) ? 10.sp : 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                addWidth(20.w),
                GestureDetector(
                  onTap: onConfirm ?? () {},
                  child: AppText(
                    text: confirmText ?? "Continue",
                    fontSize: isLargeScreen(context) ? 10.sp : 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
        );
      },
    );
    if (result == null) {
      onDismiss?.call();
    }
  }

  static Future<void> showCustomBottomSheet({
    required BuildContext context,
    String? title,
    required Widget content,
    List<Widget>? actions,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? onDismiss,
    bool barrierDismissible = true,
    bool showDragHandle = true,
    Color backgroundColor = Colors.black,
    BorderRadiusGeometry borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) async {
    await showModalBottomSheet(
      // showDragHandle: showDragHandle,
      context: context,
      isDismissible: barrierDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,

      builder: (context) => content,
    );
  }
}
