import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget addHeight(double height) {
  return SizedBox(height: height);
}

Widget addWidth(double width) {
  return SizedBox(width: width);
}

double getScreenHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;

  var padding = MediaQuery.of(context).padding;
  return height - padding.top - padding.bottom;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String formatBalance(int amount) {
  final formatter = NumberFormat('#,###');
  return formatter.format(amount);
}

bool isLargeScreen(context) {
  return getScreenWidth(context) > 600;
}
