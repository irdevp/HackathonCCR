import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final Color color;
  final String titulo;
  final String professor;
  final String cargaHoraria;

  const ButtonCard(
      {Key key, this.color, this.titulo, this.professor, this.cargaHoraria})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            professor,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            cargaHoraria,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
          )
        ],
      ),
    );
  }
}
