import 'package:flutter/material.dart';

final tema = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,

  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      centerTitle: true //TextStyle
      ),

  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8))
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(250, 255, 179, 0),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    elevation: 10,
  ),

  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
    headlineMedium: TextStyle(
        color: Color.fromARGB(250, 26, 35, 126),
        fontWeight: FontWeight.bold,
        fontSize: 30),
  ),

 elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
    ),
 ),

  scaffoldBackgroundColor: const Color(0xffFEFEFE),
);
