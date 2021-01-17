import 'package:HackathonCCR/pages/app/student/home/sub_pages/detailhe_curso/detalheCurso.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';

class HorizontalCardBusiness extends StatelessWidget {
  final String text;
  final String tipo;
  final Color color;
  final String cargaHoraria;
  const HorizontalCardBusiness(
      {Key key, this.text, this.tipo, this.color, this.cargaHoraria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetalheCurso(
                    cargaHoraria: "20 horas de aula",
                    text: "Aprenda Python na Pratica",
                    color: Color(0xFFFC871B),
                    tipo: "Desenvolvimento",
                    disponibilidade: "Remoto",
                    professor: "Ministrado por Marcelino Freitas",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo accumsan sollicitudin eleifend molestie mauris ut ornare eleifend erat. Libero habitant tincidunt pellentesque magna. Orci tristique euismod a eu id hac penatibus euismod volutpat.",
                  )));
        },
        child: Container(
            height: 250,
            width: 280,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kPrimaryColor),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Maria Eduarda",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ],
                  ),
                  Text("25 Anos",
                      style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  Text("Engenheira de software",
                      style: TextStyle(
                          color: Color(0xFFF8FBFE),
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  Text("Contratada em 12/01/2021",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            decoration: BoxDecoration(
                boxShadow: [],
                borderRadius: BorderRadius.circular(8),
                color: kCardColor)),
      ),
    );
  }
}
