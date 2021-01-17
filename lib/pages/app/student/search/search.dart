import 'package:HackathonCCR/components/defaultButton.dart';
import 'package:HackathonCCR/components/formError/error.dart';
import 'package:HackathonCCR/components/formError/formErrorCentral.dart';
import 'package:HackathonCCR/components/formError/placeholder.dart';
import 'package:HackathonCCR/pages/app/student/baseScreen.dart';
import 'package:HackathonCCR/util/animations/fadeSlide.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // final AuthenticationService _firebaseAuth = AuthenticationService();
  final _formKeySignIn = GlobalKey<FormState>();
  //Labels Erros
  final ErrorText emailError = ErrorText();
  final ErrorText passwordError = ErrorText();
  final ErrorText loginError = ErrorText();
  bool canPress = true;
  bool hasValueEmail = true;
  //ValuesField

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool remember = false;
  List<bool> _validForm = [false, false];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKeySignIn,
        child: Column(children: <Widget>[
          buildEmailFormField(),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          AnimatedOpacity(
              opacity: loginError.error != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: loginError.error != null
                  ? FormErrorCentral(
                      errorText: loginError,
                    )
                  : PlaceholderFormError()),
        ]));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (value) => {
              if (value.isNotEmpty) {setState(() {})} else {setState(() {})}
            },
        decoration: InputDecoration(
            hintText: "Digite seu email",
            hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(30), color: Color(0xFFCACACA)),
            enabledBorder:
                emailError.error != null ? outlineInputBorderError : null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: _emailController.text.isNotEmpty ? Colors.white : null,
            suffixIcon: Icon(
              MdiIcons.email,
              color: emailError.error != null ? kError : null,
            )));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        controller: _passwordController,
        textAlignVertical: TextAlignVertical.bottom,
        obscureText: true,
        onChanged: (value) => {
              if (value.isNotEmpty)
                {
                  setState(() {
                    passwordError.error = null;
                    _validForm[1] = true;
                  })
                }
              else
                {
                  setState(() {
                    _validForm[1] = false;
                  })
                }
            },
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              passwordError.error = kPassNullError;
            });
          } else {
            setState(() {
              passwordError.error = null;
            });
          }
          return null;
        },
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(30), color: Color(0xFFCACACA)),
            hintText: "Digite sua senha",
            enabledBorder:
                passwordError.error != null ? outlineInputBorderError : null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor:
                _passwordController.text.isNotEmpty ? Colors.white : null,
            suffixIcon: Icon(
              MdiIcons.lock,
              color: passwordError.error != null ? kError : null,
            )));
  }
}
