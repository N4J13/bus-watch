import 'package:bus_proj/constants/app_color.dart';
import 'package:bus_proj/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: const Color.fromARGB(255, 246, 247, 251),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    tertiary: AppColors.tertiary,
    background: Colors.white,
    surface: const Color.fromARGB(255, 246, 247, 251),
    onBackground: Colors.black,
    outline: Colors.black12,
  ),

  primaryTextTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    hourMinuteColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return Colors.white;
    }),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return AppColors.primary;
    }),
    dayPeriodTextStyle: MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
      }
      return TextStyle(
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
    }),
    dayPeriodColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return Colors.white;
    }),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: AppColors.primary, width: 1),
    ),
    dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return AppColors.primary;
    }),
    dialHandColor: AppColors.primary,
    entryModeIconColor: AppColors.primary,
    dayPeriodBorderSide: const BorderSide(color: Colors.black12),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(50, 50)),
    backgroundColor: MaterialStateProperty.all(Colors.white),
  )),
  snackBarTheme: SnackBarThemeData(
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
  cardTheme: CardTheme(
    surfaceTintColor: Colors.white,
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        const CircleBorder(),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: Colors.black12,
        ),
      ),
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(
      color: Colors.black45,
    ),
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
