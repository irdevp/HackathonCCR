import 'package:HackathonCCR/pages/auth/SignIn/body/form.dart';
import 'package:HackathonCCR/util/animations/fadeSlide.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodySignIn extends StatefulWidget {
  @override
  _BodySignInState createState() => _BodySignInState();
}

class _BodySignInState extends State<BodySignIn>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceM : kSpaceS;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(70),
              ),
              Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(120),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,
                            child: FlutterLogo(
                              size: 80,
                            )),
                        Center(
                          child: FadeSlideTransition(
                              animation: _headerTextAnimation,
                              additionalOffset: 0.0,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(40),
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ],
                    ),
                  ),
                  FadeSlideTransition(
                      animation: _headerTextAnimation,
                      additionalOffset: 0.0,
                      child: Text(
                        "Entre com seu E-mail e Senha \nou continue com uma rede social.",
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              SignForm(
                  animation: _formElementAnimation,
                  height: height,
                  space: space),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),

              // FadeSlideTransition(
              //   animation: _formElementAnimation,
              //   additionalOffset: 400,
              // ),
              // child: PromoAccountText(
              //   pressAction: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => Container()),
              //   ),
              //   phraseText: "Ainda Não Possui Conta? ",
              //   specialWord: "Cadastre-se",
              // )),

              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              FadeSlideTransition(
                  animation: _formElementAnimation,
                  additionalOffset: 500,
                  child: Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "ou",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Expanded(child: Divider()),
                  ])),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),

              FadeSlideTransition(
                  animation: _formElementAnimation,
                  additionalOffset: 600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  )),

              FadeSlideTransition(
                  animation: _formElementAnimation,
                  additionalOffset: 600,
                  child: Align(
                    child: Column(
                      children: [
                        Text("Made by Equipe 27"),
                        Text("Hackathon CCR"),
                      ],
                    ),
                    alignment: Alignment.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
