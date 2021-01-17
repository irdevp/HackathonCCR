import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF26C16E);
const kBackgroundColor = Color(0xFFFBFBFD);
const kTextColor = Color(0xFF6F6F71);
const fontHeaderNameColor = Color(0xffff57a25);

const headerTitleLogin = TextStyle(
    //color: Color(0xff0E244C),
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: "CM Sans Serif",
    color: fontHeaderNameColor,
    height: 1.0,
    letterSpacing: 1);
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp passwordValidatorRegExp =
    RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
final RegExp cepRegExp = RegExp(r"^[0-9]{5}-[\d]{3}");

const String kNameNullError = "Por Favor Digite Seu Nome";
const String kEmailNullError = "Por Favor Digite Seu Email";
const String kInvalidEmailError = "Por Favor Digite um Email Válido";
const String kPassNullError = "Por Favor Digite Sua Senha";
const String kInvalidPassError = "Por Favor Digite uma senha válida";
const String kMatchPassError = "As senha não coincidem";
const String kTooltipMensage = '• No Mínimo 8 Caracteres\n'
    '• Pelo menos um Número\n• Pelo menos uma Letra';
const String kShortPassError = "Senha contem menos de 8 Caracteres";

const Color kError = Color(0xFFD8000C);
OutlineInputBorder outlineInputBorderError = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kError),
    gapPadding: 10);
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

const Color kTextDark = Color(0xFF6A6C6F);
const Color kBackgroundColorDark = Color(0xFF1E1F26);
const Color kCardColor = Color(0xFF34353F);
