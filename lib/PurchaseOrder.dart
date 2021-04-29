import 'dart:async';
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
import 'models/siminformation.dart';
//POSSIMList(),
class PurchaseOrderPage extends StatefulWidget {
  final String myUID;

  const PurchaseOrderPage({Key key, this.myUID}) : super(key: key);

  @override
  _PurchaseOrderPageState createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage>{
  bool isSim = true, isLoad = false;
  String simValue = "", loadValue = "";
  TextEditingController _controller = new TextEditingController();

  StreamSubscription<Event> _onRetailerAdded;
  StreamSubscription<Event>  _onRetailUpdate;
  Query _todoQuery;
  DatabaseReference databaseReference, poItems;

  @override
  void initState() {

    //_todoQuery = FirebaseDatabase.instance.reference().child("po");
    databaseReference = FirebaseDatabase.instance.reference().child("po").child(widget.myUID);
    poItems = FirebaseDatabase.instance.reference().child("po").child(widget.myUID);
   // _onRetailerAdded = _todoQuery.onChildAdded.listen(onEntryPurchaseAdded);
   /// _onRetailUpdate = _todoQuery.onChildChanged.listen(onEntryPurchaseChanged);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  //  _onRetailerAdded.cancel();
  //  _onRetailUpdate.cancel();
  }

  // onEntryPurchaseAdded(Event event){
  //
  // }
  //
  // onEntryPurchaseChanged(Event event){
  //
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: new SliverChildListDelegate([
              Container(
                child: FirebaseAnimatedList(
                    reverse: true,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    query: poItems,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              print("Clicked");
                              showConfirmAlertDialog(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => SalesDetails(cartData: _cartData[index],)));
                            },
                            child: Container(
                              //margin: EdgeInsets.only(top: 5.0),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "${new DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(snapshot.value["poDate"]))}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
//                           Text(
// //                                '${_cartData[index].riderName}',
//                             'RIDER NAME',
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold),
//                           ),
                                  Spacer(),
                                  Text(
                                    snapshot.value["poType"] == "sim" ? "SIM: " + snapshot.value["poValue"].toString() + " pcs"
                                        : "Load: P: " + snapshot.value["poValue"].toString() + ".00",

                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: HexColor("#FF0000")),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: statusColor(snapshot.value["status"]),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(thickness: 2, endIndent: 10, indent: 10,),
                        ],
                      );
                    }),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#0B1043"),
        onPressed: () {
          print("LOAD");
          showPurchaseAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showPurchaseAlertDialog(BuildContext context) {
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
        if(isSim == true){
          PurchaseOrderDetails simInformation = new PurchaseOrderDetails();
          simInformation.uid = widget.myUID;
          simInformation.poValue = double.parse(simValue);
          simInformation.uidReceived = "";
          simInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          simInformation.status = "new";
          simInformation.poType = "sim";
          simInformation.poDate = DateTime.now().toIso8601String();

          Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => simInformation.toJson());
          databaseReference.update(childUpdate);
          _controller.clear();
          Navigator.of(context).pop();
        } else if (isLoad == true) {
          PurchaseOrderDetails simInformation = new PurchaseOrderDetails();
          simInformation.uid = widget.myUID;
          simInformation.poValue = double.parse(loadValue);
          simInformation.uidReceived = "";
          simInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          simInformation.status = "new";
          simInformation.poType = "load";
          simInformation.poDate = DateTime.now().toIso8601String();

          Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => simInformation.toJson());
          databaseReference.update(childUpdate);
          _controller.clear();
          Navigator.of(context).pop();
        }
        //Navigator.of(context).pop();
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
            title: Text("Purchase Order"),
            content: SingleChildScrollView(
              child: Container(
                height: 300,
                width: 400,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                          color: isSim == true ? HexColor("#0B1043") : Colors.white,
                          textColor: isSim == true ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: isSim == true ? HexColor("#0C9E1F") : HexColor("#707070"))
                          ),
                          onPressed: () {
                            setState(() {
                              isSim = true;
                              isLoad = false;
                              _controller.text = simValue;
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text("SIM", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context)
                                        .textScaleFactor *
                                        20),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        FlatButton(
                          padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                          color: isLoad == true ? HexColor("#0B1043"):Colors.white,
                          textColor: isLoad == true ?  Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: isLoad == true ? HexColor("#0B1043") : HexColor("#707070"))
                          ),
                          onPressed: () {
                            setState(() {
                              isLoad = true;
                              isSim = false;
                              _controller.text = loadValue;
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text("Load", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context)
                                        .textScaleFactor *
                                        20),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(isSim == true ? "QTY" : "AMOUNT",
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
                          ), onChanged: (text){
                                if(isSim){
                                  simValue = text;
                                 // _controller.text = simValue;
                                } else {
                                  loadValue = text;
                                  //_controller.text = simValue;
                                }

                            },
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

  showConfirmAlertDialog(BuildContext context) {
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

    // set up the AlertDialog
    AlertDialog alert = new AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: Center(child: Text("Are you sure?")),
      content: SingleChildScrollView(
        child: Container(
          height: 100,
          width: 400,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

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

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Color statusColor(String color){
    Color pickColor;

    if(color == "new"){
      pickColor = HexColor("#FFAA00");
    } else if(color == "approved") {
      pickColor = HexColor("#1FAE1A");
    } else if(color == "processed") {
      pickColor = HexColor("#0B1043");
    } else  {
      pickColor = HexColor("#FF0000");
    }
    return pickColor;
  }

}
