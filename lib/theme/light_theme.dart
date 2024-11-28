import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  fontFamily: 'Tajawal',
  primaryColor: const Color.fromRGBO(23, 128, 71, 1),
  brightness: Brightness.light,
  canvasColor: Colors.transparent,
  highlightColor: Colors.white,
  hintColor:const Color(0xFF9E9E9E),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: Color.fromRGBO(23, 128, 71, 1),
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle( //<-- SEE HERE
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  pageTransitionsTheme:const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);