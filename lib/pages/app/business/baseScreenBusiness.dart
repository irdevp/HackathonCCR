import 'package:HackathonCCR/pages/app/student/home/home.dart';
import 'package:HackathonCCR/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:HackathonCCR/pages/app/business/home/homeBusiness.dart';
import './search/searchBusiness.dart';

class BaseScreenBusiness extends StatefulWidget {
  @override
  _BaseScreenBusinessState createState() => _BaseScreenBusinessState();
}

class _BaseScreenBusinessState extends State<BaseScreenBusiness>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenBusiness(),
    SearchBusiness(),
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(color: Color(0xFF34353F)),
                  height: 70,
                  child: bottomNavigationBar()),
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
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      unselectedItemColor: Color(0xFF90A4AE),
      selectedItemColor: kPrimaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Category.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/Category.svg',
              color: kPrimaryColor,
            ),
            label: 'Cursos'),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/Search.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/Search.svg',
            color: kPrimaryColor,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/Profile.svg',
          ),
          activeIcon: SvgPicture.asset(
            'assets/images/Profile.svg',
            color: kPrimaryColor,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
