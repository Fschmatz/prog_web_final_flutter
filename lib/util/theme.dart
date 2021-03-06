import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: Color(0xFFFEFCF4),
  ),
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFEFCF4),
  scaffoldBackgroundColor: const Color(0xFFFEFCF4),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFEFCF4),
    primary: Color(0xff76990b),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xff84ab0c),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFEFCF4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFEFCF4),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    elevation: 1,
    color: Color(0xFFEEECE4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFFDEDCD4),
      contentTextStyle: TextStyle(
        color: Color(0xFF050505),
      ),
      behavior: SnackBarBehavior.floating
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFE3E4D4),
      focusColor: const Color(0xff76990b),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xff76990b),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE3E4D4),
          ),
          borderRadius: BorderRadius.circular(4.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE3E4D4),
          ),
          borderRadius: BorderRadius.circular(4.0))),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFFFEFCF4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFEFCF4),
    selectedItemColor: Color(0xff76990b),
  ),
  bottomAppBarColor: const Color(0xFFFEFCF4),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFEFCF4),
      indicatorColor: const Color(0xff76990b),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

ThemeData dark = ThemeData(
  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: Color(0xFF202022),
  ),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF202022),
  scaffoldBackgroundColor: const Color(0xFF202022),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF202022),
    primary: Color(0xFFadd53a),
    onPrimary: Color(0xFFadd53a),
    secondary: Color(0xffb4d74f),
  ),
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF3D3D3F),
      contentTextStyle: TextStyle(
        color: Color(0xFFEAEAEA),
      ),
      behavior: SnackBarBehavior.floating
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF202022),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF2D2D2F),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF353537),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF202022),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2D2D2F),
      focusColor: const Color(0xFFadd53a),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFadd53a),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2D2D2F),
          ),
          borderRadius: BorderRadius.circular(4.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2D2D2F),
          ),
          borderRadius: BorderRadius.circular(4.0))),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF202022),
  ),
  bottomAppBarColor: const Color(0xFF202022),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF202022),
      indicatorColor: const Color(0xFFadd53a),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEA),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
);
