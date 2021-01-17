import 'package:HackathonCCR/components/buttonCard.dart';
import 'package:HackathonCCR/components/horizontalCard.dart';
import 'package:HackathonCCR/pages/app/home/sub_pages/detailhe_curso/detalheCurso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                "Olá,\nEduardo.",
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
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetalheCurso(
                                            cargaHoraria: "20 horas de aula",
                                            text: "Aprenda Python na Pratica",
                                            color: Color(0xFFFC871B),
                                            tipo: "Desenvolvimento",
                                            disponibilidade: "Remoto",
                                            professor:
                                                "Ministrado por Marcelino Freitas",
                                            description:
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo accumsan sollicitudin eleifend molestie mauris ut ornare eleifend erat. Libero habitant tincidunt pellentesque magna. Orci tristique euismod a eu id hac penatibus euismod volutpat.",
                                          )));
                                },
                                child: HorizontalCard(
                                  tipo: "Desenvolvimento",
                                  color: Color(0xFFFC871B),
                                  text: "Aprenda Python na Pratica",
                                  cargaHoraria: "20 horas de aula",
                                ),
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
                                color: Color(0xFFED1563),
                                cargaHoraria: "20 horas",
                                professor: "Ministrado por João Gomes",
                                titulo: "UI Design na prática",
                              ),
                              ButtonCard(
                                color: Color(0xFF2635CE),
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
