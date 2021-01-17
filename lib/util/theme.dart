import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData themeData() {
  return ThemeData(
      appBarTheme: appBarTheme(),
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kBackgroundColorDark,
      fontFamily: 'Poppins',
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFF35363F), width: 0),
      gapPadding: 10);

  OutlineInputBorder outlineInputBorderFocus = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Color(0xFF35363F),
      ),
      gapPadding: 10);
  return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorderFocus,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      suffixStyle: TextStyle(decorationColor: Colors.green),
      isDense: true,
      filled: true,
      fillColor: Color(0xFF35363F),
      labelStyle: TextStyle(color: kTextColor));
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: kBackgroundColorDark,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600)));
}
