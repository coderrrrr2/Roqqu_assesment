import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppSpacing {
  static double get horizontalValue => 16.w;
  static double get verticalValue => 20.h;
  static double get largeVerticalValue => 24.h;

  static EdgeInsets get screen => EdgeInsets.symmetric(
    horizontal: horizontalValue,
    vertical: verticalValue,
  );
  static EdgeInsets get horizontal =>
      EdgeInsets.symmetric(horizontal: horizontalValue);
  static EdgeInsets get vertical =>
      EdgeInsets.symmetric(vertical: verticalValue);
  static EdgeInsets get small => EdgeInsets.all(8.w);
  static EdgeInsets get medium => EdgeInsets.all(16.w);
  static EdgeInsets get large => EdgeInsets.all(24.w);
}
