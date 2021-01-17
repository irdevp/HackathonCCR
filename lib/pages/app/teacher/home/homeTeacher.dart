import 'package:HackathonCCR/components/horizontalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:HackathonCCR/components/defaultButton.dart';
import 'package:HackathonCCR/util/constants.dart';
import './components/horizontalCard.dart';

class HomeScreenTeacher extends StatefulWidget {
  final String nome;

  const HomeScreenTeacher({Key key, this.nome}) : super(key: key);
  @override
  _HomeScreenTeacherState createState() => _HomeScreenTeacherState();
}

class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F26),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                "Olá,\n" + widget.nome,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Meus Cursos",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: ScreenUtil().setHeight(310),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              HorizontalCardTeacher(
                                tipo: "Desenvolvimento",
                                color: Color(0xFFFC871B),
                                text: "Aprenda Python na Pratica",
                                cargaHoraria: "20 horas de aula",
                              ),
                              HorizontalCardTeacher(
                                tipo: "RH",
                                color: Color(0xFF2635CE),
                                text: "Encontre os melhores",
                                cargaHoraria: "30 horas de aula",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Color(0xFF515151),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: DefaultButton(
                      bgColor: kPrimaryColor,
                      press: () {},
                      text: "Cadastrar um novo curso",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
