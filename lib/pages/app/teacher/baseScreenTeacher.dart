import 'package:flutter/material.dart';
import 'package:HackathonCCR/pages/app/teacher/home/homeTeacher.dart';

class BaseScreenTeacher extends StatefulWidget {
  final String nome;
  final String email;

  const BaseScreenTeacher({Key key, this.nome, this.email}) : super(key: key);
  @override
  _BaseScreenTeacherState createState() => _BaseScreenTeacherState();
}

class _BaseScreenTeacherState extends State<BaseScreenTeacher>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: HomeScreenTeacher(nome: widget.nome),
      ),
    );
  }
}
