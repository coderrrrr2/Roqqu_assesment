import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class AppColumn extends StatefulWidget {
  final bool isScrollable;
  final bool showSuccesContainer;
  final String loadingText;
  final String successHeaderText;
  final String successInfo;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool isLoading;
  final bool useBounceAnimation; // New parameter to control animation
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final Widget? bottomNavBar;
  final Widget? drawer;

  const AppColumn({
    super.key,
    this.loadingText = '',
    this.successHeaderText = '',
    this.successInfo = '',
    this.isScrollable = false,
    required this.children,
    this.showSuccesContainer = false,
    this.isLoading = false,
    this.useBounceAnimation = false,
    this.resizeToAvoidBottomInset = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
    this.drawer,
    this.bottomNavBar,
    this.backgroundColor,
  });

  @override
  State<AppColumn> createState() => _AppColumnState();
}

class _AppColumnState extends State<AppColumn> {
  void removeFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget mainContent = Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisAlignment: widget.mainAxisAlignment,
      children: widget.children,
    );

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      drawer: widget.drawer,
      body: GestureDetector(
        // onTap: () {
        //   removeFocus(context);
        // },
        child: Stack(
          children: [
            widget.isScrollable
                ? SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),

                          child: Padding(
                            padding:
                                widget.padding ??
                                EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ).copyWith(top: 10.h),
                            child: mainContent,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Padding(
                          padding:
                              widget.padding ??
                              EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ).copyWith(top: 10.h),
                          child: mainContent,
                        ),
                      ),
                    ],
                  ),
                ),

            // Loading indicator overlay
            if (widget.isLoading && !widget.showSuccesContainer)
              Container(
                color: theme.scaffoldBackgroundColor.withValues(alpha: 0.7),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.loadingText.isNotEmpty) ...[
                        AppText(
                          text: widget.loadingText,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        addHeight(10.h),
                      ],
                      SizedBox(
                        height: 26.w,
                        width: 26.w,
                        child: const CircularProgressIndicator(
                          color: AppColors.royalBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (widget.showSuccesContainer)
              Container(
                color: theme.scaffoldBackgroundColor.withValues(alpha: 0.7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: widget.successHeaderText,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                            addHeight(10.h),
                            AppText(
                              textAlign: TextAlign.center,
                              text: widget.successInfo,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
