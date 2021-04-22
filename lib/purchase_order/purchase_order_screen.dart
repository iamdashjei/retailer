import 'package:flutter/material.dart';
import 'package:wstar_retailer/models/siminformation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PurchaseOrderScreen extends StatefulWidget {
  @override
  _PurchaseOrderScreenState createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {


  List<PurchaseOrderDetails> tempPOItems = [
    PurchaseOrderDetails(poDate: DateTime.now(), poType: 'SIM', poValue: 500, status: 'PENDING'),
    PurchaseOrderDetails(poDate: DateTime.now(), poType: 'SIM', poValue: 500, status: 'CANCELLED'),
    PurchaseOrderDetails(poDate: DateTime.now(), poType: 'SIM', poValue: 500, status: 'PAID'),
    PurchaseOrderDetails(poDate: DateTime.now(), poType: 'SIM', poValue: 500, status: 'FAILED'),
    PurchaseOrderDetails(poDate: DateTime.now(), poType: 'SIM', poValue: 500, status: 'PAID'),
  ];


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
                      Row(
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

  onBackPressed(){

  }

  Widget loadPOItem(PurchaseOrderDetails poInformation) {
    var simDate = poInformation.poDate;
    var newFormat = new DateFormat('MMM dd, yyyy H:m');
    String updatedDt = newFormat.format(simDate);

    String poValue = '${poInformation..poType} :' + poInformation.poType == 'SIM' ? '' : 'P';

    /*'${poInformation..poType} :' + poInformation.poType == 'SIM' ? '' : 'P' + '${poInformation.poValue}' + poInformation.poType == 'SIM' ? 'pcs' : '',*/


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$updatedDt',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 10.0,),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(poValue,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 20.0,),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getColorBasedOnStatus(poInformation.status),
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
    );
  }

  Color getColorBasedOnStatus(String status){
    Color color;

    if(status == 'PENDING'){
      color = Color(0xFFFFAA00);
    }else if(status == 'CANCELLED'){
      color = Color(0xFF0B1043);
    }else if(status == 'PAID'){
      color = Color(0xFF1FAE1A);
    }else if(status == 'FAILED'){
      color = Colors.red;
    }




      return color;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'Open Sans'),
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF0B1043),
              title: Center(child: Text('Purchase Order')),
            ),
            drawer: buildDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tempPOItems.length,
                    itemBuilder: (context, index) {
                      return loadPOItem(tempPOItems[index]);
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(0xFF0B1043),
              onPressed: () {},
            ),
          )),
    );
  }


}
