import 'package:HackathonCCR/components/formError/error.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormErrorCentral extends StatelessWidget {
  const FormErrorCentral({Key key, @required this.errorText}) : super(key: key);

  final ErrorText errorText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(MdiIcons.closeCircle, size: ScreenUtil().setSp(32), color: kError),
        SizedBox(
          width: ScreenUtil().setWidth(12),
        ),
        Text(errorText.error,
            style: TextStyle(fontSize: ScreenUtil().setSp(22)))
      ],
    );
  }
}
