import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'body/body.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BodySignIn(),
    );
  }
}
