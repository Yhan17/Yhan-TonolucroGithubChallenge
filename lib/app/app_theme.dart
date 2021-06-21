import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData get theme => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xFF2F363D),
      primaryColor: const Color(0xFFFFFFFF),
      accentColor: const Color.fromRGBO(255, 133, 11, 0.5),
      fontFamily: 'SF Pro Display',
      appBarTheme: const AppBarTheme(
          textTheme: TextTheme(
              headline6: TextStyle(
        color: Color(0xFF2F363D),
        fontSize: 22.0,
      ))),
      colorScheme: const ColorScheme(
          primary: Color(0xFFFFFFFF),
          primaryVariant: Color(0xFFFFFFFF),
          secondary: Color(0xFF2188FF),
          secondaryVariant: Color(0xFF2188FF),
          surface: Color(0xFF24292E),
          background: Color(0xFF2F363D),
          error: Color(0xFFDE3545),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF2188FF),
          onSurface: Color(0xFF24292E),
          onBackground: Color(0xFF2F363D),
          onError: Color(0xFFDE3545),
          brightness: Brightness.light),
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontSize: 20.0),
        backgroundColor: Color(0xFFFFFFFF),
        actionTextColor: Color(0xFFFFFFFF),
      ),
      primaryIconTheme: const IconThemeData(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.grey));
}
