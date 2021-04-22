import 'package:flutter/material.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
//POSSIMList(),
class PurchaseOrderPage extends StatefulWidget {
  @override
  _PurchaseOrderPageState createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage>{
  bool isSim = true, isLoad = false;
  String simValue = "", loadValue = "";
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index){
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
                            'Apr 16, 2021 04:35 PM',
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
                            'Load: P1,000.00',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: HexColor("#FF0000")),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 2, endIndent: 10, indent: 10,),
                ],
              );
            }),
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


}
