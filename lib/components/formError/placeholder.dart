import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceholderFormError extends StatelessWidget {
  const PlaceholderFormError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("", style: TextStyle(fontSize: ScreenUtil().setSp(27)));
  }
}
