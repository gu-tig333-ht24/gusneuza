import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      border: _inputBorder,
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder.copyWith(
        borderSide: _inputBorderSide.copyWith(
          color: Colors.deepPurpleAccent,
        ),
      ),
    ),
  );

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: _inputBorderSide,
  );

  static const _inputBorderSide = BorderSide(
    width: 1.2,
    color: Colors.grey,
  );
}
