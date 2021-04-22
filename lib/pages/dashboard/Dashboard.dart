import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';

import '../../Bulletin.dart';
import '../../Chatroom.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({Key key}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _dashboardPages = <Widget>[
      SalesPage(),
      Bulletin(),
      Chatroom(),
    ];

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _dashboardPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: HexColor("#FFAA00"),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? Image.asset('assets/image/home_yellow.png', width: 25, height: 25) : Image.asset('assets/image/home_icon.png', width: 25, height: 25),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Image.asset('assets/image/bulletinyellow_icon.png', width: 25, height: 25) : Image.asset('assets/image/bulletin_icon.png', width: 25, height: 25),
            title: Text('Bulletin'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? Image.asset('assets/image/chatroom_yellow.png', width: 25, height: 25) : Image.asset('assets/image/chat_room.png', width: 25, height: 25),
            title: Text('Chatroom'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}
