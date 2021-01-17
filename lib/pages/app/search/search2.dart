import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search2 extends StatefulWidget {
  @override
  _Search2State createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  TextEditingController _fieldSearch2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  controller: _fieldSearch2,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.bottom,
                  onChanged: (value) => {
                    if (value.isNotEmpty)
                      {setState(() {})}
                    else
                      {setState(() {})}
                  },
                  decoration: InputDecoration(
                    labelText: "Pesquise por um curso",
                    fillColor: _fieldSearch2.text.isNotEmpty
                        ? Colors.white
                        : Color(0xFF35363F),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        "assets/images/Search.svg",
                      ),
                    ),
                  ),
                )),
            _fieldSearch2.text.isNotEmpty ? SizedBox() : buildSnips()
          ],
        ),
      ),
    );
  }

  Container buildSnips() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Áreas de atuação",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 17),
              ),
            ),
          ),
          Row(
            children: [
              buildTag("Design", Color(0xFFED1563)),
              buildTag("Programação", Color(0xFFFC871B)),
            ],
          ),
          Row(
            children: [
              buildTag("Recursos Humanos", Color(0xFF2635CE)),
              buildTag("Contabilidade", Color(0xFF69BA38)),
            ],
          ),
          Row(
            children: [
              buildTag("Administração", Color(0xFF9A20C5)),
              Expanded(
                child: Container(),
              )
            ],
          )
        ],
      ),
    );
  }

  Expanded buildTag(String text, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
