import 'package:HackathonCCR/components/buttonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './components/horizontalCardBusiness.dart';
import './components/buttonCardBusiness.dart';

class HomeScreenBusiness extends StatefulWidget {
  @override
  _HomeScreenBusinessState createState() => _HomeScreenBusinessState();
}

class _HomeScreenBusinessState extends State<HomeScreenBusiness> {
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
                "Bem vindo ao\nEmpregAí",
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
                          "Últimas contratações",
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
                          height: ScreenUtil().setHeight(350),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              HorizontalCardBusiness(
                                tipo: "Desenvolvimento",
                                color: Color(0xFFFC871B),
                                text: "Aprenda Python na Pratica",
                                cargaHoraria: "20 horas de aula",
                              ),
                              HorizontalCardBusiness(
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
                              ButtonCardBusiness(
                                cargaHoraria: "20 horas",
                                professor: "Ministrado por João Gomes",
                                titulo: "UI Design na prática",
                              ),
                              ButtonCardBusiness(
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
