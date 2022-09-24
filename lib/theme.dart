import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color(0xFFf75600),
  secondaryHeaderColor: Color(0xFF0c0f0a),
  dividerColor: Color(0xFFBFBFBF),
  cardColor: Color.fromARGB(255, 255, 169, 123),

  // ICONS
  iconTheme: const IconThemeData(
    color: Color(0xFFf75600),
  ),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color(0xFFf75600),
      ),

  // APP BAR THEME
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    toolbarHeight: 50,
    titleTextStyle: TextStyle(
      color: Color(0xFF0c0f0a),
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.75,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFf75600),
      size: 25,
    ),
    actionsIconTheme: IconThemeData(
      color: Color(0xFF0c0f0a),
      size: 25,
    ),
  ),

  // BOTTOM NAVIGATION BAR
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      color: Color(0xFFf75600),
    ),
    unselectedIconTheme: IconThemeData(
      color: Color(0xFF4c4c4c),
    ),
    selectedLabelStyle: TextStyle(
      color: Color(0xFFf75600),
      fontSize: 10,
    ),
    unselectedLabelStyle: TextStyle(
      color: Color(0xFF4c4c4c),
      fontSize: 10,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: false,
  ),

  // INPUT DECORATION THEME
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    hintStyle: const TextStyle(
      color: Color.fromARGB(255, 184, 184, 184),
    ),
    suffixStyle: const TextStyle(
      color: Color.fromARGB(255, 184, 184, 184),
    ),
    filled: true,
    fillColor: Colors.white,
    errorStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Color.fromARGB(255, 184, 184, 184),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Color(0xFFf75600),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
  ),

  // TEXT THEME
  textTheme: const TextTheme(
    // big headlines and titles
    headline1: TextStyle(
      color: Color(0xFF0c0f0a),
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),

    // section headings and amount text
    subtitle1: TextStyle(
      color: Color(0xFF0c0f0a),
      fontSize: 20,
    ),

    // details text
    bodyText1: TextStyle(
      color: Color(0xFF0c0f0a),
      fontSize: 17.5,
    ),

    // smalled text for dates
    bodyText2: TextStyle(
      color: Color(0xFFBFBFBF),
      fontSize: 16,
    ),
  ),
);
