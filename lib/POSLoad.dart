import 'dart:async';
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
import 'models/retailer.dart';
import 'models/siminformation.dart';
//POSSIMList(),
class POSLoad extends StatefulWidget {
  final String myUID;
  final double balance;

  const POSLoad({Key key, this.myUID, this.balance}) : super(key: key);
  @override
  _POSLoadPageState createState() => _POSLoadPageState();
}

class _POSLoadPageState extends State<POSLoad>{
  bool isFirstSelected = true, isSecondSelected = false, isThirdSelected = false, isFourthSelected = false;
  TextEditingController _controller = new TextEditingController();

  DatabaseReference databaseReference, saleItems, updateMyInfo;

  StreamSubscription<Event> _onLoadAdded;
  StreamSubscription<Event>  _onLoadUpdate;
  Query _todoQuery;

  Map<String, LoadInformation> loadMap = new HashMap<String, LoadInformation>();
  double myBalance = 0;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference().child("sales").child("load");
    saleItems = FirebaseDatabase.instance.reference().child("sales").child("load");
    updateMyInfo = FirebaseDatabase.instance.reference().child("retailers");
    // _todoQuery = databaseReference.reference().child("sales").child("sim");
    // _onLoadAdded = _todoQuery.onChildAdded.listen(onEntryLoadAdded);
    // _onLoadUpdate = _todoQuery.onChildChanged.listen(onEntryLoadChanged);

    myBalance = widget.balance;
    _controller.text = "0999 325 4651";
  }

  @override
  void dispose(){
    super.dispose();
  }

  // onEntryLoadAdded(Event event){
  //   if(event.snapshot.value != null){
  //     LoadInformation loadInfo = LoadInformation.fromSnapshot(event.snapshot);
  //     loadMap.putIfAbsent(event.snapshot.value["mobileNumber"], () => loadInfo);
  //   }
  // }
  //
  // onEntryLoadChanged(Event event){
  //   if(event.snapshot.value != null){
  //
  //   }
  // }

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
                        child: Text(myBalance.toString(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context)
                                .textScaleFactor *
                                50),),
                      ),
                      Container(
                        child: Text("Balance", style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: MediaQuery.of(context)
                                .textScaleFactor *
                                16),),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(thickness: 2, endIndent: 10, indent: 10,),
                  Container(
                    height: 700,
                    child: FirebaseAnimatedList(
                        physics: NeverScrollableScrollPhysics(),
                        query: saleItems,
                        reverse: false,
                        //shrinkWrap: true,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                          if(widget.myUID == snapshot.value["uid"] && snapshot.value["status"] == "sold"){
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: () {

                                  },
                                  trailing: Column(
                                    children: <Widget>[
                                      SizedBox(height: 5,),
                                      Container(
                                        //margin: EdgeInsets.only(left:12.0),
                                        child: Text(snapshot.value["amount"].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 25, color: HexColor("##FF0000")),),
                                      ),
                                      Text(snapshot.value["offerDescription"].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: MediaQuery.of(context).textScaleFactor * 10, color: HexColor("##FF0000")),),
                                    ],
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${new DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(snapshot.value["date"]))}",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 16)),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(Icons.phone, color: Colors.black,size: 20,),
                                      SizedBox(width: 5),
                                      Expanded(child: Text(snapshot.value["mobileNumber"].toString(), style: TextStyle(fontWeight: FontWeight.normal,
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

                ]),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#0B1043"),
        onPressed: () {
          // LoadInformation loadInformation = new LoadInformation();
          // loadInformation.uid = widget.myUID;
          // loadInformation.date = DateTime.now().toIso8601String();
          // loadInformation.mobileNumber = "09051583899";
          // loadInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          // loadInformation.amount = 1000;
          // loadInformation.offerDescription = "30 days Unli Call, Text & Data";
          // loadInformation.status = "in-stock";
          //
          // Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          // childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => loadInformation.toJson());
          // databaseReference.update(childUpdate);
          print("LOAD");

          showLoadAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showLoadAlertDialog(BuildContext context) {
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
        // if(loadMap.containsKey(_controller.text)){
        //     print(loadMap[_controller.text].mobileNumber);
        // }
        if(isFirstSelected){
          updateMyInfoBalance(199.00, _controller.text);
        } else if(isSecondSelected){
          updateMyInfoBalance(109.00, _controller.text);
        } else if(isThirdSelected){
          updateMyInfoBalance(59.00, _controller.text);
        } else if(isFourthSelected){
          updateMyInfoBalance(19.00, _controller.text);
        }


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
                title: Text("Phone Number"),
                content: SingleChildScrollView(
                  child: Container(
                    height: 320,
                    width: 450,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 70,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(0),
                            color: HexColor("#E1E1E1"),
                          ),
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.all(5.0),
                              color: isFirstSelected == true ? HexColor("#0C9E1F") : Colors.white,
                              textColor: isFirstSelected == true ? Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: isFirstSelected == true ? HexColor("#0C9E1F") : HexColor("#707070"))
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstSelected = true;
                                  isSecondSelected = false;
                                  isThirdSelected = false;
                                  isFourthSelected = false;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text("199.00", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            20),),
                                  ),
                                  Container(
                                    child: Text("30days Unli Call, Text & Data", style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            10),),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              padding: EdgeInsets.all(5.0),
                              color: isSecondSelected == true ? HexColor("#0C9E1F") : Colors.white,
                              textColor: isSecondSelected == true ?  Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: isSecondSelected == true ? HexColor("#0C9E1F") : HexColor("#707070"))
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstSelected = false;
                                  isSecondSelected = true;
                                  isThirdSelected = false;
                                  isFourthSelected = false;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text("109.00", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            20),),
                                  ),
                                  Container(
                                    child: Text("30days Unli Call, Text & Data", style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            10),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.all(5.0),
                              color: isThirdSelected == true ? HexColor("#0C9E1F") : Colors.white,
                              textColor: isThirdSelected == true ?  Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: isThirdSelected == true ? HexColor("#0C9E1F") : HexColor("#707070"))
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstSelected = false;
                                  isSecondSelected = false;
                                  isThirdSelected = true;
                                  isFourthSelected = false;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text("59.00", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            20),),
                                  ),
                                  Container(
                                    child: Text("30days Unli Call, Text & Data", style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            10),),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              padding: EdgeInsets.all(5.0),
                              color: isFourthSelected == true ? HexColor("#0C9E1F") : Colors.white,
                              textColor: isFourthSelected == true ?  Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: isFourthSelected == true ? HexColor("#0C9E1F") : HexColor("#707070"))
                              ),
                              onPressed: () {
                                setState(() {
                                  isFirstSelected = false;
                                  isSecondSelected = false;
                                  isThirdSelected = false;
                                  isFourthSelected = true;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text("19.00", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            20),),
                                  ),
                                  Container(
                                    child: Text("30days Unli Call, Text & Data", style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: MediaQuery.of(context)
                                            .textScaleFactor *
                                            10),),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

  void updateMyInfoBalance(double amount, String number) async {
    TransactionResult transactionResult = await updateMyInfo.child(widget.myUID).runTransaction((MutableData mutableData) async {
      return mutableData;
    });

    Retailer info = Retailer.fromSnapshot(transactionResult.dataSnapshot);
    info.loadBalance = info.loadBalance - amount;

    Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
    childUpdate.putIfAbsent(widget.myUID, () => info.toJson());
    updateMyInfo.update(childUpdate);

    LoadInformation loadInformation = new LoadInformation();
    loadInformation.uid = widget.myUID;
    loadInformation.date = DateTime.now().toIso8601String();
    loadInformation.mobileNumber = number;
    loadInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
    loadInformation.amount = amount;
    loadInformation.offerDescription = "30 days Unli Call, Text & Data";
    loadInformation.status = "sold";

    Map<String, dynamic> loadUpdate = new HashMap<String, dynamic>();
    loadUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => loadInformation.toJson());
    databaseReference.update(loadUpdate);

    if(!mounted) return;
    setState(() {
      myBalance = info.loadBalance;
      _controller.clear();
    });

    Fluttertoast.showToast(
        msg: "Successfully Loaded.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

}
