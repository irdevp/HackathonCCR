import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const TextStyle fontHome = TextStyle(
        fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 18);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("OLa,", style: fontHome),
              Text(
                "Maria Silva",
                style: fontHome,
              )
            ],
          ),
        ),
      ),
    );
  }
}
