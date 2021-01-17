import 'package:HackathonCCR/pages/auth/SignIn/body/form.dart';
import 'package:HackathonCCR/pages/auth/SignIn/signIn.dart';
import 'package:HackathonCCR/util/animations/fadeSlide.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Choice extends StatefulWidget {
  @override
  ChoiceState createState() => ChoiceState();
}

class ChoiceState extends State<Choice> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;
  static String typeAccount = "student";
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
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: FadeSlideTransition(
                  animation: _headerTextAnimation,
                  additionalOffset: 0.0,
                  child: SvgPicture.asset("assets/images/Logo.svg")),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    FadeSlideTransition(
                        animation: _headerTextAnimation,
                        additionalOffset: 50.0,
                        child: buildCard(
                            "Sou Aluno", "assets/images/Aluno.svg", "student")),
                    FadeSlideTransition(
                        animation: _headerTextAnimation,
                        additionalOffset: 90.0,
                        child: buildCard("Sou Professor",
                            "assets/images/Professor.svg", "teacher")),
                    FadeSlideTransition(
                        animation: _headerTextAnimation,
                        additionalOffset: 120.0,
                        child: buildCard("Sou uma empresa",
                            "assets/images/Empresa.svg", "business")),
                  ],
                ),
              ))
        ],
      )),
    );
  }

  Padding buildCard(String title, String pathIcon, String typeAc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: RaisedButton(
        textColor: Colors.white,
        color: Color(0xFF35363F),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(pathIcon),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Icon(MdiIcons.arrowRight)
            ],
          ),
        ),
        onPressed: () => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => SignIn())),
          typeAccount = typeAc
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
