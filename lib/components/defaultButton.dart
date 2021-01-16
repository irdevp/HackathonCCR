import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.bgColor})
      : super(key: key);
  final Color bgColor;
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(100),
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: bgColor != null ? bgColor : kPrimaryColor,
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
