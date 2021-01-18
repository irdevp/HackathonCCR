import 'package:HackathonCCR/pages/app/student/home/sub_pages/detailhe_curso/detalheCurso.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  final String text;
  final String tipo;
  final Color color;
  final String cargaHoraria;
  const HorizontalCard(
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
                    cargaHoraria: cargaHoraria,
                    text: text,
                    color: color,
                    tipo: tipo,
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
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
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
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(cargaHoraria,
                              style: TextStyle(
                                  color: Color(0xFFD3D3D3),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  )
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
