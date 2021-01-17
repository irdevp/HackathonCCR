import 'package:HackathonCCR/components/defaultButton.dart';
import 'package:HackathonCCR/components/formError/error.dart';
import 'package:HackathonCCR/components/formError/formErrorCentral.dart';
import 'package:HackathonCCR/components/formError/placeholder.dart';
import 'package:HackathonCCR/pages/app/student/baseScreen.dart';
import 'package:HackathonCCR/pages/auth/Choice/choice.dart';
import 'package:HackathonCCR/pages/auth/serviceauth.dart';
import 'package:HackathonCCR/util/animations/fadeSlide.dart';
import 'package:HackathonCCR/pages/app/business/baseScreenBusiness.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignForm extends StatefulWidget {
  final Animation<double> animation;

  final double space;
  final double height;
  const SignForm({Key key, this.animation, this.height, this.space})
      : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // final AuthenticationService _firebaseAuth = AuthenticationService();
  final _formKeySignIn = GlobalKey<FormState>();
  //Labels Erros
  final ErrorText emailError = ErrorText();
  final ErrorText passwordError = ErrorText();
  final ErrorText loginError = ErrorText();
  bool canPress = true;
  bool hasValueEmail = true;
  var dio = Dio();
  //ValuesField

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool remember = false;
  List<bool> _validForm = [false, false];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeySignIn,
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 0.0,
              child: SizedBox(
                height: ScreenUtil().setHeight(120),
                child: buildEmailFormField(),
              )),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          PlaceholderFormError(),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: widget.space,
              child: SizedBox(
                  height: ScreenUtil().setHeight(120),
                  child: buildPasswordFormField())),
          PlaceholderFormError(),
          AnimatedOpacity(
              opacity: loginError.error != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: loginError.error != null
                  ? FormErrorCentral(
                      errorText: loginError,
                    )
                  : PlaceholderFormError()),
          FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 2 * widget.space,
              child: Row(
                children: [
                  Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                        });
                      }),
                  Text(
                    "Manter Logado",
                    style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                  ),
                  Spacer(),
                  GestureDetector(
                      child: Text(
                    "Esqueceu a Senha?!",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: ScreenUtil().setSp(24)),
                  ))
                ],
              )),
          FadeSlideTransition(
              animation: widget.animation,
              additionalOffset: 3 * widget.space,
              child: DefaultButton(
                text: "Entrar",
                press: _validForm.contains(false)
                    ? null
                    : () async {
                        _validForm[1] = false;
                        setState(() {
                          canPress = false;
                        });
                        if (_formKeySignIn.currentState.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          var result;
                          Response response;
                          if (passwordValidatorRegExp
                              .hasMatch(_passwordController.text.trim())) {
                            try {
                              response = await dio.post(
                                  "https://hackathon-ccr-2.herokuapp.com/login",
                                  data: {
                                    "email": _emailController.text,
                                    "password": _passwordController.text,
                                    "type": ChoiceState.typeAccount
                                  });
                              result = "200";
                              print(response.data);
                            } catch (e) {
                              result = "user-not-found";
                            }
                          } else {
                            result = 'wrong-password';
                            _passwordController.text = "";
                          }
                          if (result == '200') {
                            if (ChoiceState.typeAccount == "student") {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          BaseScreen(
                                            email: response.data['email'],
                                            nome: response.data['name'],
                                          )));
                            } else if (ChoiceState.typeAccount == "teacher") {
                            } else {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          BaseScreenBusiness()));
                            }
                          } else {
                            if (result == 'wrong-password' ||
                                result == 'user-not-found') {
                              _passwordController.text = "";
                              setState(() {
                                emailError.error = "";
                                passwordError.error = "";
                                loginError.error = "Login ou Senha Incorreto";
                              });
                            } else if (result == 'too-many-requests') {
                              setState(() {
                                loginError.error = "Muitas tentativas";
                              });
                            } else {
                              setState(() {
                                loginError.error =
                                    "Serviço Indisponivel no momento";
                              });
                            }
                          }
                        }
                      },
              ))
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (value) => {
              if (value.isNotEmpty && emailValidatorRegExp.hasMatch(value))
                {
                  setState(() {
                    emailError.error = null;
                    _validForm[0] = true;
                  })
                }
              else
                {
                  setState(() {
                    _validForm[0] = false;
                  })
                }
            },
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              emailError.error = kEmailNullError;
            });
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            setState(() {
              emailError.error = kInvalidEmailError;
            });
          } else {
            setState(() {
              emailError.error = null;
            });
          }
          return null;
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
