import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
//POSSIMList(),
class POSSIMList extends StatefulWidget {
  @override
  _POSSIMListPageState createState() => _POSSIMListPageState();
}

class _POSSIMListPageState extends State<POSSIMList>{
  TextEditingController _controller = new TextEditingController();
  String tagBarcode = "";
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("86 SIMs", style: TextStyle(
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
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index){
                      return Column(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              print("Tapped");

                            }, trailing: Text("1000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 25, color: HexColor("##FF0000")),),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Apr 16, 2021 04:35 PM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 16)),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Image.asset('assets/image/barcode.png', width: 15, height: 20),
                                Expanded(child: Text(" 5176310988_73371690339", style: TextStyle(fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic, fontSize: MediaQuery.of(context).textScaleFactor * 15,
                                    color: HexColor("##FF0000")))),

                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                          Divider(thickness: 2, endIndent: 10, indent: 10,),
                        ],
                      );
                }),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#0B1043"),
        onPressed: ()  async {
          print("SIM");
          String barcodeScanRes = await FlutterBarcodeScanner
              .scanBarcode(
              "#ff6666",
              "Cancel",
              false,
              ScanMode.QR);
          showBarcodeAlertDialog(context, barcodeScanRes);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showBarcodeAlertDialog(BuildContext context, String result) {
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
    // AlertDialog alert = new AlertDialog(
    //   contentPadding: EdgeInsets.zero,
    //   title: Center(child: Text("Scan Barcode")),
    //   content: SingleChildScrollView(
    //     child: Container(
    //       height: 300,
    //       width: 400,
    //       child: Column(
    //         //crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           FlatButton(
    //             color: HexColor("#E1E1E1"),
    //             textColor: Colors.white,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(5.0),
    //                 side: BorderSide(color: HexColor("#E1E1E1"))
    //             ),
    //             child: Text("Scan"),
    //             onPressed: () async {
    //               String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    //                   "#ff6666",
    //                   "Cancel",
    //                   false,
    //                   ScanMode.BARCODE);
    //
    //               setState(() {
    //                 if(barcodeScanRes !=  null){
    //                   tagBarcode = barcodeScanRes;
    //                 }
    //
    //               });
    //               print(barcodeScanRes);
    //             },
    //           ),
    //           Text(tagBarcode),
    //           SizedBox(height: 20),
    //           Container(
    //             height: 70,
    //             decoration: new BoxDecoration(
    //               borderRadius: new BorderRadius.circular(0),
    //               color: HexColor("#E1E1E1"),
    //             ),
    //             child: Center(
    //               child: Text("100.00",
    //                   style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                   fontSize: MediaQuery.of(context)
    //                       .textScaleFactor *
    //                       45),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //                 cancel, SizedBox(width: 30), okButton
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   // actions: [
    //   //   Center(child: cancel ,),
    //   //   okButton,
    //   // ],
    // );

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
                      child: Text("100.00",
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

}
