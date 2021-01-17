import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DefaultButtonBorder extends StatelessWidget {
  const DefaultButtonBorder({Key key, this.text, this.press, this.borderColor})
      : super(key: key);
  final Color borderColor;
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(105),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 3, color: borderColor)),
          color: Colors.transparent,
          disabledColor: kTextColor,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
