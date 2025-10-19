import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class CopyTradingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBack;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? elevation;

  const CopyTradingAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.onBack,
    this.backgroundColor,
    this.iconColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      leading:
          showBackButton
              ? Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: iconColor ?? Colors.white,
                    size: 20.sp,
                    weight: 20.w,
                  ),
                  onPressed: onBack ?? () => AppNavigator.popRoute(),
                ),
              )
              : null,
      title: AppText(
        text: title ?? AppStrings.copytrading,
        fontSize: 16.sp,
        variant: TextVariant.interRegular,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
