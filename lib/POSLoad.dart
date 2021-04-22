import 'package:flutter/material.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
//POSSIMList(),
class POSLoad extends StatefulWidget {
  @override
  _POSLoadPageState createState() => _POSLoadPageState();
}

class _POSLoadPageState extends State<POSLoad>{
  bool isFirstSelected = true, isSecondSelected = false, isThirdSelected = false, isFourthSelected = false;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.text = "0999 325 4651";
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
                    child: Text("3,528.72", style: TextStyle(
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
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index){
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
                                  child: Text("1000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 25, color: HexColor("##FF0000")),),
                                ),
                                Text("30days Unli Call, Text & Data", style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: MediaQuery.of(context).textScaleFactor * 10, color: HexColor("##FF0000")),),
                              ],
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Apr 16, 2021 04:35 PM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).textScaleFactor * 16)),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Icon(Icons.phone, color: Colors.black,),
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
        onPressed: () {
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
    //   title: Text("Phone Number"),
    //   content: SingleChildScrollView(
    //     child: Container(
    //       height: 320,
    //       width: 400,
    //       child: Column(
    //         //crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Container(
    //             height: 70,
    //             decoration: new BoxDecoration(
    //               borderRadius: new BorderRadius.circular(0),
    //               color: HexColor("#E1E1E1"),
    //             ),
    //             child: Center(
    //               child: Text("0999 325 4651",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black,
    //                     fontSize: MediaQuery.of(context)
    //                         .textScaleFactor *
    //                         45),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               FlatButton(
    //                 padding: EdgeInsets.all(5.0),
    //                 color: HexColor("#0C9E1F"),
    //                 textColor: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     side: BorderSide(color: HexColor("#0C9E1F"))
    //                 ),
    //                 onPressed: () {  },
    //                 child: Column(
    //                   children: <Widget>[
    //                     Container(
    //                       child: Text("199.00", style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               20),),
    //                     ),
    //                     Container(
    //                       child: Text("30days Unli Call, Text & Data", style: TextStyle(
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               10),),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               FlatButton(
    //                 padding: EdgeInsets.all(5.0),
    //                 color: Colors.white,
    //                 textColor: Colors.black,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     side: BorderSide(color: HexColor("#707070"))
    //                 ),
    //                 onPressed: () {  },
    //                 child: Column(
    //                   children: <Widget>[
    //                     Container(
    //                       child: Text("109.00", style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               20),),
    //                     ),
    //                     Container(
    //                       child: Text("30days Unli Call, Text & Data", style: TextStyle(
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               10),),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 20),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               FlatButton(
    //                 padding: EdgeInsets.all(5.0),
    //                 color: Colors.white,
    //                 textColor: Colors.black,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     side: BorderSide(color: HexColor("#707070"))
    //                 ),
    //                 onPressed: () {  },
    //                 child: Column(
    //                   children: <Widget>[
    //                     Container(
    //                       child: Text("199.00", style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               20),),
    //                     ),
    //                     Container(
    //                       child: Text("30days Unli Call, Text & Data", style: TextStyle(
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               10),),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               FlatButton(
    //                 padding: EdgeInsets.all(5.0),
    //                 color: Colors.white,
    //                 textColor: Colors.black,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     side: BorderSide(color: HexColor("#707070"))
    //                 ),
    //                 onPressed: () {  },
    //                 child: Column(
    //                   children: <Widget>[
    //                     Container(
    //                       child: Text("109.00", style: TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               20),),
    //                     ),
    //                     Container(
    //                       child: Text("30days Unli Call, Text & Data", style: TextStyle(
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: MediaQuery.of(context)
    //                               .textScaleFactor *
    //                               10),),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 20),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               cancel, SizedBox(width: 30), okButton
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

}
