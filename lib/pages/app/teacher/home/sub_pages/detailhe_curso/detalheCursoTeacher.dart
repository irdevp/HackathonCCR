import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:HackathonCCR/components/defaultButton.dart';
import 'package:HackathonCCR/components/defaultButtonBorder.dart';

class DetalheCursoTeacher extends StatelessWidget {
  final String text;
  final String tipo;
  final Color color;
  final String cargaHoraria;
  final String description;
  final String disponibilidade;
  final String professor;

  const DetalheCursoTeacher(
      {Key key,
      this.text,
      this.tipo,
      this.color,
      this.cargaHoraria,
      this.description,
      this.disponibilidade,
      this.professor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColorDark,
      appBar: AppBar(
        title: Text("Curso"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                tipo,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(cargaHoraria,
                      style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 22,
                  ),
                  Text(professor,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 22,
                  ),
                  Text("DESCRIÇÃO",
                      style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  Divider(
                    color: Color(0xFF515151),
                  ),
                  Text(description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DefaultButtonBorder(
                            borderColor: Colors.white,
                            text: "Editar Informações",
                            press: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultButton(
                            bgColor: Colors.redAccent,
                            text: "Desativar este curso",
                            press: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
