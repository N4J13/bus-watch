import 'package:bus_proj/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 251),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
  ),
  snackBarTheme:  SnackBarThemeData(
    showCloseIcon: true,
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
   
    contentTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    insetPadding: const EdgeInsets.all(10),
    closeIconColor: Colors.black38,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    dragHandleSize: const Size(80, 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    dragHandleColor: Colors.grey,
    showDragHandle: true,
  ),
  dividerColor: Colors.black12,
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
  ),
  textTheme: GoogleFonts.dmSansTextTheme(),
  // Add more theme properties as needed
);
