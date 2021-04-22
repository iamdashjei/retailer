import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wstar_retailer/models/siminformation.dart';
import 'package:intl/intl.dart';
import 'package:wstar_retailer/purchase_order/purchase_order_screen.dart';

import '../POSSIMPlaceOrder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SIMInformation> tempItems = [
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 340),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 200),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
    SIMInformation(
        date: DateTime.now(), barcodeNumber: '12313 654654 89798', amount: 500),
  ];

  List<LoadInformation> tempLoadItems = [
    LoadInformation(
        date: DateTime.now(),
        mobileNumber: '09151234567',
        amount: 199,
        offerDescription: '30days Unli Call, Text & Data'),
    LoadInformation(
        date: DateTime.now(),
        mobileNumber: '09151234568',
        amount: 199,
        offerDescription: '30days Unli Call, Text & Data'),
    LoadInformation(
        date: DateTime.now(),
        mobileNumber: '09151234569',
        amount: 99,
        offerDescription: '30days Unli Call, Text & Data'),
    LoadInformation(
        date: DateTime.now(),
        mobileNumber: '09151234560',
        amount: 19,
        offerDescription: '30days Unli Call, Text & Data'),
    LoadInformation(
        date: DateTime.now(),
        mobileNumber: '09151234561',
        amount: 9,
        offerDescription: '30days Unli Call, Text & Data'),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'Open Sans'),
      child: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0B1043),
            title: Center(child: Text('POS')),
            bottom: TabBar(
              indicatorColor: Color(0xFFFFAA00),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  text: 'SIM',
                ),
                Tab(text: 'LOAD'),
              ],
            ),
          ),
          drawer: buildDrawer(),
          body: TabBarView(
            children: [
              buildSIMTab(),
              buildLoadTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF0B1043),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    POSSIMPlaceOrder(),
              ));
            },
          ),
        ),
      )),
    );
  }

  Widget simInfoItem(SIMInformation simInformation) {
    var simDate = simInformation.date;
    var newFormat = new DateFormat('MMM dd, yyyy H:m');
    String updatedDt = newFormat.format(simDate);

    return GestureDetector(
      onTap: (){
        print("On pressed! " + updatedDt);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$updatedDt',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.barcode),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${simInformation.barcodeNumber}',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    '${simInformation.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  ),
                ]),
              ],
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget loadInfoItem(LoadInformation loadInformation) {
    var simDate = loadInformation.date;
    var newFormat = new DateFormat('MMM dd, yyyy H:m');
    String updatedDt = newFormat.format(simDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$updatedDt',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${loadInformation.mobileNumber}',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  '${loadInformation.amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '${loadInformation.offerDescription}',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                ),
              ]),
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }

/*
  List<Widget> buildSIMList() {
    List<Widget> returnValue = [];
    int ctr = 0;

    for (SIMInformation siminfo in tempItems) {

      returnValue.add(
        Row(
          children: [
            Column(
             children: [
               Row(
                 children: [
                   Text('${siminfo.date}'),
                   Text('${siminfo.barcodeNumber}'),
                 ],
               ),
               SizedBox(width: 10,),
               Row(
                 children: [
                   Text('${siminfo.amount}'),
                 ],
               ),
             ],
            ),
            Divider(),
          ],
        ),
      );
    }
    return returnValue;
  }*/

  buildSIMTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '86 SIMs',
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B1043)),
                  ),
                ),
                Container(
                  child: Text(
                    'remaining',
                    style: TextStyle(fontSize: 20, color: Color(0xFF0B1043)),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF373737),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tempItems.length,
            itemBuilder: (context, index) {
              return simInfoItem(tempItems[index]);
            },
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  buildLoadTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '3,528.72',
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B1043)),
                  ),
                ),
                Container(
                  child: Text(
                    'Balance',
                    style: TextStyle(fontSize: 20, color: Color(0xFF0B1043)),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF373737),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tempLoadItems.length,
            itemBuilder: (context, index) {
              return loadInfoItem(tempLoadItems[index]);
            },
          ),
        ],
      ),
    );
  }

  buildDrawer() {
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Hi, James',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          )),
                      Text(
                        'Retailer',
                        style: TextStyle(
                            fontSize: 12,
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
                      Row(
                        children: [
                          Icon(
                            Icons.speed_outlined,
                            color: Color(0xFF0B1043),
                            size: 25,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Dashboard',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF0B1043),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mobile_friendly_outlined,
                            color: Color(0xFF0B1043),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('POS',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF0B1043),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => PurchaseOrderScreen()),
                                  (route) => false);
                        },
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.boxOpen,
                              color: Color(0xFF0B1043),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Purchase Order',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0B1043),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
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
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Color(0xFF0B1043),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('Profile',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF0B1043),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.infoCircle,
                          color: Color(0xFF0B1043),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('Profile',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF0B1043),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color(0xFF0B1043),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('Log-out',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF0B1043),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
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
