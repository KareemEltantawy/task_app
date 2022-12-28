import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,  //false alashan aref aAdel fe el status bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white, // the same color as backgroundColor of the appbar
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
//    titleSpacing: 20.0,
//    titleTextStyle: TextStyle(
//      color: Colors.black,
//      fontSize: 20.0,
//      fontWeight: FontWeight.bold,
//    ),
//    iconTheme: IconThemeData(
//      color: Colors.black,
//    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: defaultColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
    ),
    bodyText2: TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);



