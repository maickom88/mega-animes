import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class ThemeApp {
  static TextTheme _textTheme() => TextTheme(
        button: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 17,
        ),
        headline1: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 16,
        ),
        headline2: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          color: ColorsConst.titleColor,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
        bodyText1: TextStyle(
          fontFamily: "Montserrat",
          color: ColorsConst.descriptionColor,
          fontSize: 16,
          fontWeight: FontWeight.w200,
        ),
        bodyText2: TextStyle(
          fontFamily: "Montserrat",
          color: ColorsConst.descriptionColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontFamily: "Montserrat",
          color: ColorsConst.titleColor,
          fontSize: 24,
        ),
        headline5: TextStyle(
          fontFamily: "Montserrat",
          color: ColorsConst.titleColor,
          fontSize: 18,
          fontWeight: FontWeight.w200,
        ),
        headline6: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 18,
        ),
      );

  static ThemeData theme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ThemeData(
      scaffoldBackgroundColor: ColorsConst.primaryColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      primaryColor: ColorsConst.primaryColor,
      accentColor: ColorsConst.accentColor,
      cardColor: ColorsConst.descriptionColor,
      errorColor: ColorsConst.errorColor,
      secondaryHeaderColor: ColorsConst.secondaryColor,
      primaryColorDark: ColorsConst.darkColor,
      textTheme: _textTheme(),
    );
  }
}
