import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(213, 147, 246, 208),
        iconTheme: IconThemeData(color: Colors.black, size: 40),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color.fromARGB(213, 147, 246, 208),
        elevation: 10,
      ),
      iconTheme: const IconThemeData(color: Colors.white54, size: 60),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          shadowColor: Colors.grey,
          elevation: 10,
          padding: const EdgeInsets.all(10.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        subtitle2: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
