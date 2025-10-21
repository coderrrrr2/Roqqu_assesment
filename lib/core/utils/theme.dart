import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.backgroundColor,
  brightness: Brightness.dark,
);

final theme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: colorScheme.copyWith(
    primary: AppColors.backgroundColor,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
  ),
  textTheme: GoogleFonts.encodeSansTextTheme(
    ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: const Color.fromRGBO(40, 45, 51, 1),
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: GoogleFonts.encodeSans(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: GoogleFonts.encodeSans(
      color: Colors.grey[300],
      fontSize: 14,
    ),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    iconColor: Colors.white,
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: GoogleFonts.encodeSans(color: Colors.white),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    indicatorColor: Colors.white,
    height: 48,
    elevation: 10,
    iconTheme: WidgetStateProperty.all(
      const IconThemeData(color: Colors.white),
    ),
    labelTextStyle: WidgetStateProperty.all(
      GoogleFonts.encodeSans(fontSize: 12, color: Colors.white),
    ),
  ),
);
