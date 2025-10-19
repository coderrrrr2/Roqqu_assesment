import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/navigation/app_navigator.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/utils/assets.dart';
import 'package:roqqu_assesment/shared/widgets/app_text.dart';
import 'package:roqqu_assesment/shared/widgets/shared_widgets.dart';

class MoreForYouOverlay extends StatelessWidget {
  final bool showOverlay;
  final VoidCallback onDismiss;

  const MoreForYouOverlay({
    super.key,
    required this.showOverlay,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child:
          showOverlay
              ? GestureDetector(
                key: const ValueKey('overlay-visible'),
                onTap: onDismiss,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(color: AppColors.opaqueBlack),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onDismiss,
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                        _OverlayContent(),
                      ],
                    ),
                  ),
                ),
              )
              : const SizedBox.shrink(key: ValueKey('overlay-hidden')),
    );
  }
}

class _OverlayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ).copyWith(top: 24.h, bottom: 11.h),
      width: 358.w,
      height: 651.h,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
          bottom: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Trade',
            items: [
              _MenuItem(icon: trade, label: 'Buy', onTap: () {}),
              _MenuItem(icon: trade, label: 'Sell', onTap: () {}),
              _MenuItem(icon: trade, label: 'Swap', onTap: () {}),
              _MenuItem(icon: trade, label: 'Send', onTap: () {}),
              _MenuItem(icon: trade, label: 'Receive', onTap: () {}),
              _MenuItem(
                icon: trade,
                label: 'Invest',
                hasNewBadge: true,
                onTap: () {},
              ),
            ],
          ),
          addHeight(24.h),
          _buildSection(
            title: 'Earn',
            items: [
              _MenuItem(
                icon: trade,
                label: 'Roqq\'n\'roll',
                hasNewBadge: true,
                onTap: () {},
              ),
              _MenuItem(icon: trade, label: 'Savings', onTap: () {}),
              _MenuItem(icon: trade, label: 'Savings', onTap: () {}),
              _MenuItem(
                icon: trade,
                label: 'Missions',
                hasNewBadge: true,
                onTap: () {},
              ),
              _MenuItem(
                icon: trade,
                label: 'Copy trading',
                hasNewBadge: true,
                onTap: () {
                  AppNavigator.pushRoute(CopyTradingRoutes.copyTrading);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 14.sp,
          color: AppColors.grey5,
          variant: TextVariant.encodeBold,
        ),
        addHeight(8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [...items.map(_buildMenuItem)],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(_MenuItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFF2B3139),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgImage(item.icon, width: 16.w, height: 16.w),
              ),
            ),
            addWidth(16.w),
            Expanded(
              child: AppText(
                text: item.label,
                fontSize: 14.sp,
                variant: TextVariant.interRegular,
                color: Colors.white,
              ),
            ),
            if (item.hasNewBadge) ...[
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.opaqueYellow,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: AppText(
                  text: 'New',
                  fontSize: 12.sp,
                  variant: TextVariant.interRegular,
                  color: AppColors.yellow,
                ),
              ),
              addWidth(14.w),
            ],
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF6C7080),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String icon;
  final String label;
  final bool hasNewBadge;
  final VoidCallback onTap;

  _MenuItem({
    required this.icon,
    required this.label,
    this.hasNewBadge = false,
    required this.onTap,
  });
}
