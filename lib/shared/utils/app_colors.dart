import 'package:flutter/material.dart';

class AppColors {
  static const royalBlue = Color.fromRGBO(72, 59, 235, 1);
  static const violet = Color.fromRGBO(120, 71, 225, 1);
  static const rosePink = Color.fromRGBO(221, 86, 141, 1);
  static const lightBlack = Color.fromRGBO(41, 40, 40, 0.612);
  static const opaqueBlack = Color.fromRGBO(0, 0, 0, 0.4);
  static const black = Color.fromRGBO(28, 33, 39, 1);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const red = Color.fromRGBO(255, 42, 84, 1.0);
  static const red2 = Color.fromRGBO(255, 85, 74, 0.08);
  static const backgroundColor = Color(0xFF1C2127);
  static const backgroundColor2 = Color.fromRGBO(42, 47, 54, 1);
  static const grey = Color.fromRGBO(167, 177, 188, 1);
  static const grey2 = Color.fromRGBO(32, 37, 43, 1);
  static const grey3 = Color.fromRGBO(38, 41, 50, 1);
  static const grey4 = Color.fromRGBO(118, 118, 128, 0.12);
  static const grey5 = Color.fromRGBO(167, 177, 188, 1);
  static const grey6 = Color.fromRGBO(32, 37, 43, 1);
  static const grey7 = Color.fromRGBO(167, 177, 188, 0.08);
  static const grey8 = Color.fromRGBO(42, 47, 54, 1);
  static const skyBlue = Color.fromRGBO(133, 209, 240, 1);
  static const skyBlue2 = Color.fromRGBO(171, 226, 243, 1);
  static const mintTeal = Color.fromRGBO(189, 228, 229, 1);
  static const paleSand = Color.fromRGBO(235, 233, 208, 1);
  static const roseBlush = Color.fromRGBO(244, 222, 242, 1);
  static const lilacMist = Color.fromRGBO(222, 216, 247, 1);
  static const periwinkleBlue = Color.fromRGBO(201, 210, 251, 1);
  static const lighBlue = Color.fromRGBO(39, 100, 255, 1);
  static const lighBlue2 = Color.fromRGBO(29, 53, 115, 1);
  static const opaqueYellow = Color.fromRGBO(222, 155, 9, 0.08);
  static const yellow = Color.fromRGBO(247, 144, 9, 1);
  static const lightyYellow = Color.fromRGBO(247, 144, 9, 0.08);
  static const lightYellow2 = Color.fromRGBO(255, 255, 255, 0.4);
  static const yellow2 = Color.fromRGBO(247, 147, 26, 1);
  static const skyBlue3 = Color.fromRGBO(133, 209, 240, 1);
  static const successGreen = Color.fromRGBO(23, 178, 106, 1);
  static const lightSuccessGreen = Color.fromRGBO(23, 178, 106, 0.08);
  static const pink = Color.fromRGBO(192, 207, 254, 1);
  static const pinkPurple = Color.fromRGBO(243, 223, 244, 1);
  static const lightPink = Color.fromRGBO(249, 216, 229, 1);

  static Color getRandomColor(String key) {
    const List<Color> palette = [
      Color(0xFFFFB800), // Amber
      Color(0xFF4CAF50), // Green
      Color(0xFF2196F3), // Blue
      Color(0xFFFF5722), // Deep Orange
      Color(0xFF9C27B0), // Purple
      Color(0xFFE91E63), // Pink
      Color(0xFF00BCD4), // Cyan
      Color(0xFFFF9800), // Orange
    ];
    final int index = key.hashCode.abs() % palette.length;
    return palette[index];
  }
}
