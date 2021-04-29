import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wstar_retailer/Bulletin.dart';
import 'package:wstar_retailer/POSSIM.dart';
import 'package:wstar_retailer/models/retailer.dart';
import 'package:wstar_retailer/pages/profile/myprofile.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wstar_retailer/api_connection/stream_user_api.dart';
import 'package:wstar_retailer/pages/bulletin/news_feed.dart';

import '../AboutUs.dart';
import '../Chatroom.dart';
import '../PurchaseOrder.dart';
import 'chatroom/chat.dart';
import 'dashboard/Dashboard.dart';

class MainDashboardPage extends StatefulWidget {
@override
_MainDashboardPageState createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> with WidgetsBindingObserver{

  String currentTab = '', nameTab = '';
  String uid, type, displayName;
  int _selectedIndex = 0;
  TextEditingController _controller = new TextEditingController();
  double amountBalance = 2000.0;
  final formatter = new NumberFormat("#,##0.00#", "en_US");

  SharedPreferences preferences;
  DatabaseReference profileReference;

  Retailer retailerData;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        currentTab = "sales";
      } else if (index == 1){
        currentTab = "bulletin";
        nameTab = "Bulletin";
      } else if (index == 2){
        currentTab = "chatroom";
        nameTab = "Chatroom";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentTab = "sales";
    nameTab = "Dashboard";
    _controller.text = formatter.format(amountBalance);
    initPrefAndLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: HexColor("#0B1043"),
          title: Text(nameTab),
          // flexibleSpace: Image(
          //   image: AssetImage('assets/image/outerbox_bg.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        drawer: Drawer(
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Hi, James',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          Text(
                            'Retailer',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              Navigator.pop(context);
                              setState(() {
                                nameTab = "Dashboard";
                                currentTab = "sales";
                              });
                            },
                            child: Row(
                                children: [
                                ImageIcon(
                                  AssetImage("assets/image/dashboard.png"), size: 30, color: Color(0xFF0B1043),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('Dashboard',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0B1043),
                                    )),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 25.0,
                          ),

                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              Navigator.pop(context);
                              setState(() {
                                nameTab = "POS";
                                currentTab = "pos";
                              });
                            },
                            child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/image/pos.png"), size: 30, color: Color(0xFF0B1043),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('POS',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0B1043),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              Navigator.pop(context);
                              setState(() {
                                nameTab = "Purchase Order";
                                currentTab = "purchase_order";
                              });
                            },
                            child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/image/po.png"), size: 30, color: Color(0xFF0B1043),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('Purchase Order',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0B1043),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
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
                        // GestureDetector(
                        //   behavior: HitTestBehavior.translucent,
                        //   onTap: (){
                        //     showConvertLoadAlertDialog(context);
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.event_note,
                        //         color: HexColor("#FF0000"),
                        //       ),
                        //       SizedBox(
                        //         width: 10.0,
                        //       ),
                        //       Text('2,000 Cash-Bond (Status)',
                        //           style: TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold,
                        //             color: HexColor("#FF0000"),
                        //           )),
                        //     ],
                        //   ),
                        // ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage(myInfo: retailerData),
                            ));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.0,
                              ),
                              ImageIcon(
                                AssetImage("assets/image/profile.png"), size: 30, color: Color(0xFF0B1043),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text('Profile',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B1043),
                                  )),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                              setState(() {
                                Navigator.pop(context);
                                currentTab = "aboutus";
                                nameTab = "About Us";
                              });
                          },
                          child: Row(
                              children: [
                                SizedBox(
                                  width: 5.0,
                                ),
                                ImageIcon(
                                  AssetImage("assets/image/info.png"), size: 30, color: Color(0xFF0B1043),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('About Us',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF0B1043),
                                    )),
                              ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.0,
                            ),
                            ImageIcon(
                              AssetImage("assets/image/out.png"), size: 30, color: Color(0xFF0B1043),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Log-out',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF0B1043),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        //body: bodyView(currentTab, userData, localToken));
        body: bodyView(currentTab),
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

  //Widget bodyView(String selectTab, UserModel userModel, User localToken) {
  Widget bodyView(String selectTab) {
    if (selectTab == "dashboard") {
      return DashboardPage();
    }
    else if (selectTab == "pos") {
      setState(() {
        _selectedIndex = 0;
      });
      return POSSIM(myUID: uid);
    }
    else if (selectTab == "purchase_order") {
      setState(() {
        _selectedIndex = 0;
      });
      return PurchaseOrderPage(myUID: uid,);
    }
    else if (selectTab == "sales") {
      return SalesPage();
    }
    else if (selectTab == "bulletin") {
      setState(() {
        _selectedIndex = 1;
      });
      return NewsFeed(uid: uid, type: type, displayName: displayName);
    }
    else if (selectTab == "chatroom") {
      setState(() {
        _selectedIndex = 2;
      });
      return Chat();
    }
    else if (selectTab == "aboutus") {
      _selectedIndex = 0;
      return AboutUsPage();
    }
    else {

      return Container();
    }

  }

  showConvertLoadAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      color: HexColor("#0C9E1F"),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: HexColor("#0C9E1F"))
      ),
      child: Text("Confirm"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the button
    Widget cancel = FlatButton(
      color: HexColor("#FF0000"),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: HexColor("#FF0000"))
      ),
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                title: Center(child: Text("Convert to Load?")),
                content: SingleChildScrollView(
                  child: Container(
                    height: 250,
                    width: 400,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Center(
                          child: Text("AMOUNT",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: MediaQuery.of(context)
                                    .textScaleFactor *
                                    25),
                          ),
                        ),
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(0),
                            color: HexColor("#E1E1E1"),
                          ),
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context)
                                      .textScaleFactor *
                                      45),
                              controller: _controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            cancel, SizedBox(width: 30), okButton
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // actions: [
                //   Center(child: cancel ,),
                //   okButton,
                // ],
              );
            }
        );

      },
    );
  }

  void initPrefAndLogin() async {
    preferences = await SharedPreferences.getInstance();
    profileReference = FirebaseDatabase.instance.reference().child("retailers").child(preferences.getString("myUIDRetailer"));
    TransactionResult transactionResultForUser = await profileReference.runTransaction((MutableData mutableData) async {
      return mutableData;
    });

    if(transactionResultForUser.dataSnapshot.value != null){
      print("initLogin");

      type = transactionResultForUser.dataSnapshot.value["type"];
      List<String> userEmailLoggedIn = transactionResultForUser.dataSnapshot.value["email"].split("@");

      await StreamUserApi.login(idUser: userEmailLoggedIn[0].toString(),
          fullName: transactionResultForUser.dataSnapshot.value["name"],
          avatar: transactionResultForUser.dataSnapshot.value["avatar"],
          type: transactionResultForUser.dataSnapshot.value["type"],
          uid: transactionResultForUser.dataSnapshot.value["uid"]);

      // preferences.setString("myUID", transactionResultForUser.dataSnapshot.value["uid"]);
      uid = transactionResultForUser.dataSnapshot.value["uid"];
      displayName = transactionResultForUser.dataSnapshot.value["fullName"];

      retailerData = Retailer.fromSnapshot(transactionResultForUser.dataSnapshot);
      //userName = preferences.getString("userName");

      //_updateStateUser("Active");
      // createChannelWithUsers(userEmailLoggedIn[0].toString());
    }
  }

}