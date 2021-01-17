import 'package:flutter/material.dart';

class ButtonCardBusiness extends StatelessWidget {
  final String titulo;
  final String professor;
  final String cargaHoraria;

  const ButtonCardBusiness(
      {Key key, this.titulo, this.professor, this.cargaHoraria})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
