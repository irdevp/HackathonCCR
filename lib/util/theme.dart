import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData themeData() {
  var kPrimaryColor;
  return ThemeData(
      appBarTheme: appBarTheme(),
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: 'Montserrat',
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10);

  OutlineInputBorder outlineInputBorderFocus = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: kPrimaryColor),
      gapPadding: 10);
  return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorderFocus,
      suffixStyle: TextStyle(decorationColor: Colors.green),
      isDense: true,
      labelStyle: TextStyle(color: kTextColor));
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: kBackgroundColor,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black45,
      ),
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Color(0xFF8B8B8B), fontSize: 18, fontFamily: 'Roboto')));
}
