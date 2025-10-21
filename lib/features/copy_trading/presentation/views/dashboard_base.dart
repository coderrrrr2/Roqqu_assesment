import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roqqu_assesment/core/constants/strings.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/dashboard_view.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/dashboard/more_for_you_overlay.dart';
import 'package:roqqu_assesment/features/navigation/nav_bar_viewmodel.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/utils/assets.dart';

class DashboardBase extends HookConsumerWidget {
  const DashboardBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(navBarProvider);
    final navBarIndex = navState.currentIndex;
    final isNavbarShown = navState.isNavbarShown;
    final showOverlay = useState(false);

    useEffect(() {
      if (navBarIndex != 4 && showOverlay.value) showOverlay.value = false;
      return null;
    }, [navBarIndex]);

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: navBarIndex == 4 ? 0 : navBarIndex,
            children: const [
              DashboardView(),
              DashboardView(),
              DashboardView(),
              DashboardView(),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: MoreForYouOverlay(
                showOverlay: showOverlay.value,
                onDismiss: () => showOverlay.value = false,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          isNavbarShown
              ? Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor.withAlpha(100),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20.h,
                          bottom: 8.h,
                          left: 16.w,
                          right: 16.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavItem(
                              homeIcon,
                              AppStrings.home,
                              0,
                              navBarIndex,
                              ref,
                            ),
                            _buildNavItem(
                              walletIcon,
                              AppStrings.wallet,
                              1,
                              navBarIndex,
                              ref,
                            ),
                            SizedBox(width: 56.w),
                            _buildNavItem(
                              historyIcon,
                              AppStrings.history,
                              2,
                              navBarIndex,
                              ref,
                            ),
                            _buildNavItem(
                              profileIcon,
                              AppStrings.profile,
                              3,
                              navBarIndex,
                              ref,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 47.h,
                    child: _buildCenterButton(showOverlay),
                  ),
                ],
              )
              : const SizedBox.shrink(key: ValueKey('hidden_nav')),
    );
  }

  Widget _buildCenterButton(ValueNotifier<bool> showOverlay) {
    final isActive = showOverlay.value;
    return Padding(
      padding: EdgeInsets.only(top: 10.h), // adds vertical breathing space
      child: GestureDetector(
        onTap: () => showOverlay.value = !isActive,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.lighBlue, AppColors.lighBlue2],
            ),
          ),
          child: AnimatedRotation(
            turns: isActive ? 0.125 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(Icons.add, color: AppColors.white, size: 28.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String iconPath,
    String label,
    int index,
    int currentIndex,
    WidgetRef ref,
  ) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => ref.read(navBarProvider.notifier).updateIndex(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgImage(
              iconPath,
              width: isSelected ? 24.w : 22.w,
              height: isSelected ? 24.w : 22.w,
              color: isSelected ? AppColors.white : AppColors.grey5,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: GoogleFonts.inter(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontSize: isSelected ? 12.sp : 10.sp,
                color: isSelected ? AppColors.white : AppColors.grey5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
