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
