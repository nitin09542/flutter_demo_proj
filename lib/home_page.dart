import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes/main_page.dart';
import 'package:flutter_app/routes/profile.dart';
import 'package:flutter_app/routes/setting.dart';
import 'package:flutter_app/themes/theme.dart';

class HomeBase extends StatefulWidget {
  @override
  State<HomeBase> createState() => HomeBasePage();
}

class HomeBasePage extends State<HomeBase> {
  int _selectedIndex = 0;
  static List<dynamic> _widgetOptions = <dynamic>[
    MainClass(),
    Profile(),
    Setting()
   ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getTabLayout(){
    return
      Container(
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Standerd"),
            Text("Mediam"),
            Text("djj"),
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("HomeBase"),),
    body:SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: AppTheme.fullHeight(context) - 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTabLayout(),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInToLinear,
                      switchOutCurve: Curves.easeOutBack,
                      child: _widgetOptions.elementAt(_selectedIndex),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ],
      ),
    ),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );

  }
}
