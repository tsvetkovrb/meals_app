import 'package:flutter/material.dart';

ThemeData configureTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Color(0xff00A08A),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
