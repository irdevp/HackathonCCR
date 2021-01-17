import 'dart:async';

import 'package:HackathonCCR/components/buttonCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search2 extends StatefulWidget {
  @override
  _Search2State createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  TextEditingController _fieldSearch2 = TextEditingController();
  List queryList = [];
  int queryCount = 0;
  Response response;
  Dio dio = new Dio();
  Timer _debounce;

  _onSearchChanged(String item) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {});
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 250), () {
        setState(() async {
          response = await dio.get(
              "https://hackathon-ccr-2.herokuapp.com/courses/search/" + item);
          print(response.data);
          print("https://hackathon-ccr-2.herokuapp.com/courses/search/");
          setState(() {
            queryList = response.data[0];
            queryCount = response.data[1];
          });
        });
      });
      // do something with _searchQuery.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  controller: _fieldSearch2,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.bottom,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {});
                      _onSearchChanged(value.toString());
                    } else {
                      setState(() {});
                    }
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
          ),
          Expanded(
              flex: 5,
              child: _fieldSearch2.text.isEmpty
                  ? buildSnips()
                  : ListView.builder(
                      itemCount: queryCount,
                      itemBuilder: (context, index) {
                        return ButtonCard(
                          color: Colors.red,
                          titulo: queryList[index]['title'].toString(),
                          professor: "Professor",
                          cargaHoraria: "20 Horas",
                        );
                      }))
        ],
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
        child: InkWell(
          onTap: () {
            setState(() {
              _fieldSearch2.text = text;
            });
          },
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
        ),
      ),
    );
  }
}
