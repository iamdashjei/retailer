import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wstar_retailer/home/bulletin_screen.dart';
import 'package:wstar_retailer/home/chatroom_screen.dart';
import 'package:wstar_retailer/home/home_screen.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }


  List<Widget> buildScreens(){
    return[
        HomeScreen(),
        BulletinScreen(persistentTabController: _controller,),
      ChatRoomScreen(persistentTabController: _controller,),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return[
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Home"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Color(0xFF0B1043),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list_outlined),
        title: ("Bulletin"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Color(0xFF0B1043),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat_rounded),
        title: ("Chat Room"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Color(0xFF0B1043),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Open Sans'
      ),
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: buildScreens(),
        items: _navBarItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset:
        true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style8,
      ),
    );
  }

  buildDrawer(){
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                color: Color(0xFF0B1043),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                            child: Image.asset('assets/images/splash_image.png'),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text('Hi, James',style: TextStyle(fontSize: 14, color: Colors.white,) ),
                      Text('Retailer', style: TextStyle(fontSize: 12, color: Colors.white, fontStyle: FontStyle.italic),)
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.speed_outlined, color: Color(0xFF0B1043), size: 25,),
                          SizedBox(width: 10.0,),
                          Text('Dashboard',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        children: [
                          Icon(Icons.mobile_friendly_outlined, color: Color(0xFF0B1043),),
                          SizedBox(width: 10.0,),
                          Text('POS',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.boxOpen, color: Color(0xFF0B1043),),
                          SizedBox(width: 10.0,),
                          Text('Purchase Order',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Color(0xFF0B1043),),
                        SizedBox(width: 10.0,),
                        Text('Profile',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.infoCircle, color: Color(0xFF0B1043),),
                        SizedBox(width: 10.0,),
                        Text('Profile',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.logout, color: Color(0xFF0B1043),),
                        SizedBox(width: 10.0,),
                        Text('Log-out',style: TextStyle(fontSize: 12, color: Color(0xFF0B1043),) ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
