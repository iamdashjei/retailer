import 'dart:async';
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
import 'models/retailer.dart';
import 'models/siminformation.dart';
//POSSIMList(),
class POSSIMList extends StatefulWidget {
  final String myUID;

  const POSSIMList({Key key, this.myUID}) : super(key: key);
  @override
  _POSSIMListPageState createState() => _POSSIMListPageState();
}

class _POSSIMListPageState extends State<POSSIMList>{
  TextEditingController _controller = new TextEditingController();
  String tagBarcode = "";

  DatabaseReference databaseReference, saleItems, updateMyInfo;
  Map<String, SIMInformation> simMap = new HashMap<String, SIMInformation>();

  StreamSubscription<Event> _onSIMAdded;
  StreamSubscription<Event>  _onSIMUpdate;
  Query _todoQuery;

  int simCounter = 0;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference().child("sales").child("sim");
    saleItems = FirebaseDatabase.instance.reference().child("sales").child("sim");

    _todoQuery = FirebaseDatabase.instance.reference().child("sales").child("sim");
    _onSIMAdded = _todoQuery.onChildAdded.listen(onEntrySIMAdded);
    _onSIMUpdate = _todoQuery.onChildChanged.listen(onEntrySIMChanged);

    updateMyInfo = FirebaseDatabase.instance.reference().child("retailers");

    initMySimInfo();
  }

  @override
  void dispose(){
    super.dispose();
    _onSIMAdded.cancel();
    _onSIMUpdate.cancel();
  }

  onEntrySIMAdded(Event event){
      if(event.snapshot.value != null){
        //setState(() {
          SIMInformation simInfo = SIMInformation.fromSnapshot(event.snapshot);
          simMap.putIfAbsent(event.snapshot.value["barcodeNumber"], () => simInfo);
        //});

      }
  }

  onEntrySIMChanged(Event event){
    if(event.snapshot.value != null){

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: new SliverChildListDelegate([
                SizedBox(height: 10),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(simCounter.toString() + " SIMs", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context)
                              .textScaleFactor *
                              50),),
                    ),
                    Container(
                      child: Text("remaining", style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context)
                              .textScaleFactor *
                              16),),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(thickness: 2, endIndent: 10, indent: 10,),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 800,
                        child: FirebaseAnimatedList(
                            physics: NeverScrollableScrollPhysics(),
                            query: saleItems,
                            reverse: false,
                            //shrinkWrap: true,
                            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                              if(snapshot.value["uid"].toString() == widget.myUID && snapshot.value["status"].toString() != "sold"){
                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                      onTap: () {
                                        print("Tapped");

                                      }, trailing: Text(snapshot.value["amount"].toString() + ".00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 25, color: HexColor("##FF0000")),),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("${new DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(snapshot.value["date"]))}",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 16)),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Image.asset('assets/image/barcode.png', width: 15, height: 20),
                                          SizedBox(width: 5),
                                          Expanded(child: Text(snapshot.value["barcodeNumber"].toString(), style: TextStyle(fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic, fontSize: MediaQuery.of(context).textScaleFactor * 15,
                                              color: HexColor("##FF0000")))),

                                          SizedBox(width: 5,),
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2, endIndent: 10, indent: 10,),
                                  ],
                                );
                              } else {
                                return Container();
                              }

                            }),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#0B1043"),
        onPressed: ()  async {
          print("SIM");
          // SIMInformation simInformation = new SIMInformation();
          // simInformation.date = DateTime.now().toIso8601String();
          // simInformation.barcodeNumber = "89636621100111524117";
          // simInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          // simInformation.uidReceived = "";
          // simInformation.uid = widget.myUID;
          // simInformation.amount = 200;
          // simInformation.status = "in-stock";
          //
          // Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          // childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => simInformation.toJson());
          // databaseReference.update(childUpdate);
          String barcodeScanRes = await FlutterBarcodeScanner
              .scanBarcode(
              "#ff6666",
              "Cancel",
              false,
              ScanMode.BARCODE);
          print(barcodeScanRes);
          if(simMap.containsKey(barcodeScanRes)){
            print("SCANNING =>" + simMap[barcodeScanRes].key);
            showBarcodeAlertDialog(context, barcodeScanRes, simMap[barcodeScanRes]);
          } else {
            Fluttertoast.showToast(
                msg: "No result found.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          // showBarcodeAlertDialog(context, barcodeScanRes);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showBarcodeAlertDialog(BuildContext context, String result, SIMInformation simInfo) {
    if(result == null){
      result = "No Result found.";
    }
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
        simInfo.status = "sold";
        simInfo.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
        Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
        childUpdate.putIfAbsent(simInfo.key, () => simInfo.toJson());
        databaseReference.update(childUpdate);
        updateMySimInfo();
        Fluttertoast.showToast(
            msg: "Successfully Sold.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
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
        builder: (context, setState)
      {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Center(child: Text("Scan Barcode")),
          content: SingleChildScrollView(
            child: Container(
              height: 300,
              width: 450,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // FlatButton(
                  //   color: HexColor("#E1E1E1"),
                  //   textColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5.0),
                  //       side: BorderSide(color: HexColor("#E1E1E1"))
                  //   ),
                  //   child: Text("Scan"),
                  //   onPressed: () async {
                  //     String barcodeScanRes = await FlutterBarcodeScanner
                  //         .scanBarcode(
                  //         "#ff6666",
                  //         "Cancel",
                  //         false,
                  //         ScanMode.BARCODE);
                  //
                  //     setState(() {
                  //       if (barcodeScanRes != null) {
                  //         tagBarcode = barcodeScanRes;
                  //       }
                  //     });
                  //     print(barcodeScanRes);
                  //   },
                  // ),
                  Text(result),
                  SizedBox(height: 20),
                  Container(
                    height: 70,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(0),
                      color: HexColor("#E1E1E1"),
                    ),
                    child: Center(
                      child: Text(simInfo.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: MediaQuery
                                .of(context)
                                .textScaleFactor *
                                45),
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
      });
      },
    );
  }

  void updateMySimInfo() async {
    TransactionResult transactionResult = await updateMyInfo.child(widget.myUID).runTransaction((MutableData mutableData) async {
      return mutableData;
    });

    Retailer info = Retailer.fromSnapshot(transactionResult.dataSnapshot);
    info.simCount = info.simCount - 1;

    Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
    childUpdate.putIfAbsent(widget.myUID, () => info.toJson());
    updateMyInfo.update(childUpdate);

    setState(() {
      simCounter = info.simCount;
    });
  }

  void initMySimInfo() async {
    TransactionResult transactionResult = await updateMyInfo.child(widget.myUID).runTransaction((MutableData mutableData) async {
      return mutableData;
    });

    Retailer info = Retailer.fromSnapshot(transactionResult.dataSnapshot);
    setState(() {
      simCounter = info.simCount;
    });
  }

}
