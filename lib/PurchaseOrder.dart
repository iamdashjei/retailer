import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'models/siminformation.dart';
import 'models/retailer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


//POSSIMList(),
class PurchaseOrderPage extends StatefulWidget {
  final String myUID;
  final String displayName;
  final String token;

  const PurchaseOrderPage({Key key, this.myUID, this.displayName, this.token}) : super(key: key);

  @override
  _PurchaseOrderPageState createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage>{
  bool isSim = true, isLoad = false;
  String simValue = "", loadValue = "";
  TextEditingController _controller = new TextEditingController();
  RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  StreamSubscription<Event> _onSalesAdded , _onSalesAdded2;
  StreamSubscription<Event>  _onSalesUpdate, _onSalesUpdate2;
  Query _todoQuerySim, _todoQueryLoad;
  DatabaseReference databaseReference, poItems, salesItem, updateSalesInfo, userReference;

  Future<List<PurchaseOrderAPI>> _futureListCurrent;
  List<PurchaseOrderAPI> listPurchaseOrderItem = [];

  List<SIMInformation> simList = [];
  List<LoadInformation> loadList = [];

  String tokenApi = '';

  final formatter = new NumberFormat("#,##0.00#", "en_US");

  @override
  void initState() {

    userReference = FirebaseDatabase.instance.reference().child("retailers");
    databaseReference = FirebaseDatabase.instance.reference().child("po");
    poItems = FirebaseDatabase.instance.reference().child("po");

    updateSalesInfo = FirebaseDatabase.instance.reference().child("sales");
    _todoQuerySim = FirebaseDatabase.instance.reference().child("sales").child("sim");
   _onSalesAdded = _todoQuerySim.onChildAdded.listen(onEntrySalesAdded);
   _onSalesUpdate = _todoQuerySim.onChildChanged.listen(onEntrySalesChanged);

    _todoQueryLoad = FirebaseDatabase.instance.reference().child("sales").child("load");
    _onSalesAdded2 = _todoQueryLoad.onChildAdded.listen(onEntrySalesAdded2);
    _onSalesUpdate2 = _todoQueryLoad.onChildChanged.listen(onEntrySalesChanged2);

    tokenApi = widget.token;


    setState(() {
      _futureListCurrent =  myOrderItems(tokenApi);
    });


    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _onSalesAdded.cancel();
    _onSalesUpdate.cancel();
    _onSalesAdded2.cancel();
    _onSalesUpdate2.cancel();
  }

  Future<List<PurchaseOrderAPI>> myOrderItems(String myToken) async {
    final response = await http.get(
      Uri.https('api.wstarict.com', 'api/v1/auth/purchaseOrders/my_orders'),
      headers: {
        HttpHeaders.authorizationHeader:'Bearer $myToken',
      },
    );

    print("Status code => "+ response.statusCode.toString());


    if(response.statusCode == 200){

      List<PurchaseOrderAPI> listPurchaseOrder = [];

      var data = json.decode(response.body);
      var rawData = data["data"];
      for(int i = 0; i < rawData.length; i++){
        //print(data[i]["raw_id"]);
        //print(data[i]);
        listPurchaseOrder.add(PurchaseOrderAPI.fromJson(rawData[i]));
      }

      //print("Added to list => "+ listPurchaseOrder.length.toString());

      return listPurchaseOrder;
    } else {
      throw Exception('Request Failed.');
    }


  }

  onEntrySalesAdded(Event event){
    if(event.snapshot.value["status"] == "generated" && event.snapshot.value["uid"] == widget.myUID){
      SIMInformation simInfo = SIMInformation.fromSnapshot(event.snapshot);
      simList.add(simInfo);
    }
  }

  onEntrySalesChanged(Event event){}

//////////////////////////////////////////////////

  onEntrySalesAdded2(Event event){
    if(event.snapshot.value["status"] == "generated" && event.snapshot.value["uid"] == widget.myUID){
      LoadInformation loadInfo = LoadInformation.fromSnapshot(event.snapshot);
      loadList.add(loadInfo);
    }

  }

  onEntrySalesChanged2(Event event){}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: new SliverChildListDelegate([
              // Container(
              //   child: FirebaseAnimatedList(
              //       reverse: true,
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       query: poItems,
              //       itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              //         if(widget.myUID == snapshot.value["uid"]){
              //           return Column(
              //             children: <Widget>[
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               GestureDetector(
              //                 behavior: HitTestBehavior.translucent,
              //                 onTap: () {
              //                   print("Clicked PO");
              //                   showConfirmAlertDialog(context, snapshot);
              //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => SalesDetails(cartData: _cartData[index],)));
              //                 },
              //                 child: Container(
              //                   //margin: EdgeInsets.only(top: 5.0),
              //                   padding: EdgeInsets.all(10),
              //                   child: Row(
              //                     children: <Widget>[
              //                       Text(
              //                         "${new DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(snapshot.value["poDate"]))}",
              //                         style:
              //                         TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              //                       ),
              //                       SizedBox(
              //                         width: 20,
              //                       ),
              //                       Spacer(),
              //                       Text(
              //                         snapshot.value["poType"] == "sim" ? "SIM: " + snapshot.value["poValue"].toString() + " pcs"
              //                             : "Load: P " + snapshot.value["poValue"].toString() + ".00",
              //                         style:
              //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: HexColor("#FF0000")),
              //                       ),
              //                       SizedBox(
              //                         width: 5,
              //                       ),
              //                       Container(
              //                         width: 20,
              //                         height: 20,
              //                         decoration: BoxDecoration(
              //                           shape: BoxShape.circle,
              //                           color: statusColor(snapshot.value["status"]),
              //                         ),
              //                       ),
              //
              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Divider(thickness: 2, endIndent: 10, indent: 10,),
              //             ],
              //           );
              //         } else {
              //           return Container();
              //         }
              //       }),
              // ),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: FutureBuilder<List<PurchaseOrderAPI>>(
                    future: _futureListCurrent,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.done){
                        if(snapshot.hasData){
                          listPurchaseOrderItem = snapshot.data;
                          return ListView.builder(
                            itemCount: listPurchaseOrderItem.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      print("Clicked PO");
                                      //showConfirmAlertDialog(context, snapshot);
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SalesDetails(cartData: _cartData[index],)));
                                    },
                                    child: Container(
                                      //margin: EdgeInsets.only(top: 5.0),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "${new DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.parse(listPurchaseOrderItem[index].createdAt))}",
                                            style:
                                            TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Spacer(),
                                          Text(
                                              listPurchaseOrderItem[index].itemId == 1 ? "SIM: " + formatter.format(listPurchaseOrderItem[index].quantity) + " pcs"
                                                : "Load: P " + formatter.format(listPurchaseOrderItem[index].amount),

                                            style:
                                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: HexColor("#FF0000")),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: statusColor(listPurchaseOrderItem[index].status),
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
                            }
                          );
                        } else {
                          return Container();
                        }
                      } else if(snapshot.hasError){
                        return Text("${snapshot.error}");
                      }

                      return Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: LoadingIndicator(indicatorType: Indicator.ballRotateChase, color: HexColor("#0B1043"),),
                        ),
                      );

                    },
                ),
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
          // PurchaseOrderDetails poInformation = new PurchaseOrderDetails();
          // poInformation.uid = widget.myUID;
          // poInformation.businessName = widget.displayName;
          // poInformation.poValue = double.parse(simValue);
          // poInformation.uidReceived = "";
          // poInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          // poInformation.status = "new";
          // poInformation.poType = "sim";
          // poInformation.poDate = DateTime.now().toIso8601String();
          //
          // Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          // childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => poInformation.toJson());
          // databaseReference.update(childUpdate);
          // _controller.clear();
          Navigator.of(context).pop();
        } else if (isLoad == true) {
          // PurchaseOrderDetails simInformation = new PurchaseOrderDetails();
          // simInformation.uid = widget.myUID;
          // simInformation.businessName = widget.displayName;
          // simInformation.poValue = double.parse(loadValue);
          // simInformation.uidReceived = "";
          // simInformation.transactTimestamp = DateTime.now().millisecondsSinceEpoch;
          // simInformation.status = "new";
          // simInformation.poType = "load";
          // simInformation.poDate = DateTime.now().toIso8601String();
          //
          // Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
          // childUpdate.putIfAbsent(DateTime.now().millisecondsSinceEpoch.toString(), () => simInformation.toJson());
          // databaseReference.update(childUpdate);
          // _controller.clear();
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

  showConfirmAlertDialog(BuildContext context, DataSnapshot snapshot) {
    // set up the button
    Widget okButton = RoundedLoadingButton(
      color: HexColor("#0C9E1F"),
      successColor: HexColor("#0C9E1F"),
      width: 100,
      height: 36,
      controller: _btnController,
      borderRadius: 5,
      // textColor: Colors.white,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5.0),
      //     side: BorderSide(color: HexColor("#0C9E1F"))
      // ),
      child: Text("Confirm", style: TextStyle(color: Colors.white),),
      onPressed: ()  async {
        Timer(Duration(seconds: 3), () {
          _btnController.success();
          Navigator.of(context).pop();
        });

        // if(snapshot.value["poType"] == "sim"){
        //   print(simList.length.toString() + " ---Generated Length");
        //
        //   for(SIMInformation simItem in simList){
        //     if(snapshot.key == simItem.generatedKey){
        //       simItem.status = "in-stock";
        //       Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
        //       childUpdate.putIfAbsent(simItem.key, () => simItem.toJson());
        //       updateSalesInfo.child("sim").update(childUpdate);
        //
        //     }
        //   }
        //
        //   PurchaseOrderDetails poInformation = PurchaseOrderDetails.fromSnapshot(snapshot);
        //   poInformation.status = "approved";
        //   Map<String, dynamic> poUpdate = new HashMap<String, dynamic>();
        //   poUpdate.putIfAbsent(poInformation.key, () => poInformation.toJson());
        //   databaseReference.update(poUpdate);
        //   Navigator.of(context).pop();
        // } else if(snapshot.value["poType"] == "load"){
        //   print(loadList.length.toString() + " ---Generated Length");
        //   for(LoadInformation loadInfo in loadList){
        //     if(snapshot.key == loadInfo.generatedKey){
        //       loadInfo.status = "approved";
        //       Map<String, dynamic> childUpdate = new HashMap<String, dynamic>();
        //       childUpdate.putIfAbsent(loadInfo.key, () => loadInfo.toJson());
        //       updateSalesInfo.child("load").update(childUpdate);
        //
        //       TransactionResult transactionResultForUser = await userReference.child(snapshot.value["uid"]).runTransaction((MutableData mutableData) async {
        //         return mutableData;
        //       });
        //
        //       Retailer retailer = Retailer.fromSnapshot(transactionResultForUser.dataSnapshot);
        //       retailer.loadBalance += snapshot.value["poValue"];
        //       Map<String, dynamic> retailerUpdate = new HashMap<String, dynamic>();
        //       retailerUpdate.putIfAbsent(snapshot.value["uid"], () => retailer.toJson());
        //       userReference.update(retailerUpdate);
        //
        //       PurchaseOrderDetails poInformation = PurchaseOrderDetails.fromSnapshot(snapshot);
        //       poInformation.status = "approved";
        //       Map<String, dynamic> poUpdate = new HashMap<String, dynamic>();
        //       poUpdate.putIfAbsent(poInformation.key, () => poInformation.toJson());
        //       databaseReference.update(poUpdate);
        //     }
        //
        //   }
        //   Timer(Duration(seconds: 3), () {
        //     _btnController.success();
        //     Navigator.of(context).pop();
        //   });
        //
        //
        // }

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
          builder: (context, setState){
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Center(child: Text("Mark as Received?")),
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
                          cancel, SizedBox(width: 30), okButton,
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
          },
        );
      },
    );
  }

  Color statusColor(String color){
    Color pickColor;

    if(color == "0"){
      pickColor = HexColor("#FFAA00");
    } else if(color == "2") {
      pickColor = HexColor("#1FAE1A");
    } else if(color == "1") {
      pickColor = HexColor("#0B1043");
    } else  {
      pickColor = HexColor("#FF0000");
    }
    return pickColor;
  }

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
  }

}
