import 'package:HackathonCCR/pages/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Container(),
    Container(
      color: Colors.amber,
    ),
    Container()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(height: 70, child: bottomNavigationBar()),
              ),
            ),
          )
          //
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selectedIndex == 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                )
              ],
            )
          : Container(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      unselectedItemColor: Color(0xFFF434A50),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.home,
            ),
            label: 'BaseScreen'),
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.home,
          ),
          label: 'Localidade',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.home,
          ),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            MdiIcons.home,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
