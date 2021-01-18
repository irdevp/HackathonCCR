import 'package:HackathonCCR/components/buttonCard.dart';
import 'package:HackathonCCR/components/horizontalCard.dart';
import 'package:HackathonCCR/pages/app/student/home/sub_pages/detailhe_curso/detalheCurso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  final String nome;

  const HomeScreen({Key key, this.nome}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Random random = new Random();
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
                              HorizontalCard(
                                tipo: "Desenvolvimento",
                                color: Color(0xFFFC871B),
                                text: "Aprenda Python na Pratica",
                                cargaHoraria: "20 horas de aula",
                              ),
                              HorizontalCard(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Outros cursos",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              ButtonCard(
                                color: kListColor[
                                    random.nextInt(kListColor.length)],
                                cargaHoraria: "20 horas",
                                professor: "Ministrado por João Gomes",
                                titulo: "UI Design na prática",
                              ),
                              ButtonCard(
                                color: kListColor[
                                    random.nextInt(kListColor.length)],
                                cargaHoraria: "16 horas",
                                professor: "Ministrado por Andressa Alves",
                                titulo: "Encontre os melhores profissionais",
                              )
                            ],
                          )),
                    ],
                  ),
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
