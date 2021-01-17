import 'dart:async';

import 'package:HackathonCCR/pages/auth/Choice/choice.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:HackathonCCR/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:HackathonCCR/pages/app/business/baseScreenBusiness.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EmpregAí',
          theme: themeData(),
          //home: SignIn(),
          home: Main(),
        ));
  }
}

class Main extends StatefulWidget {
  static const DELAY_TO_NEXT_SCREEN = Duration(milliseconds: 4000);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  AnimationController slideAnimation;

  AnimationController fadeAnimation;

  @override
  void initState() {
    super.initState();
    fadeAnimation =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);

    slideAnimation =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              slideAnimation.reverse();
              Timer(Duration(milliseconds: 150), fadeAnimation.forward);
            }
          });
    Timer(Duration(milliseconds: 700), slideAnimation.forward);
  }

  @override
  void dispose() {
    fadeAnimation.dispose();
    slideAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Main.DELAY_TO_NEXT_SCREEN,
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Choice())));
    return Scaffold(
      backgroundColor: kBackgroundColorDark,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SlideTransition(
                          position: Tween(
                                  begin: Offset(0.0, 0.0),
                                  end: Offset(0.0, 0.3))
                              .animate(CurvedAnimation(
                                  parent: slideAnimation,
                                  curve: Curves.easeInBack)),
                          child: Container(
                              child:
                                  SvgPicture.asset("assets/images/Logo.svg")))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
