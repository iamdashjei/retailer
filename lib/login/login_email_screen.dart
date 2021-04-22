import 'package:flutter/material.dart';
import 'package:wstar_retailer/util/hex_color.dart';

class LoginEmailScreen extends StatefulWidget {

  @override
  _LoginEmailScreenState createState() => new _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  bool isFingerprint = false;
  TextEditingController _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child:  Image.asset("assets/images/splash_image.png", width: 300, height: 250,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Enter your New E-mail Address", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context)
                        .textScaleFactor *
                        16),),
              ),
              Container(
                height: 70,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(0),
                  color: HexColor("#E1E1E1"),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
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
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Make sure your e-mail is registered by your Sub Dealer", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context)
                        .textScaleFactor *
                        14),),
              ),
              SizedBox(height: 30),
              Center(
                child: FlatButton(
                  padding: EdgeInsets.only(left: 80.0, right: 80.0),
                  color:  HexColor("#FFAA00"),
                  textColor: HexColor("#0B1043"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: HexColor("#FFAA00"))
                  ),
                  onPressed: () {

                  },
                  child: Text("NEXT", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context)
                          .textScaleFactor *
                          14),),
                ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Or use Existing E-mail Address (Select One)", style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context)
                            .textScaleFactor *
                            15),),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: 8,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {

                            },
                            child: Container(
                              //margin: EdgeInsets.only(top: 5.0),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'jhenanne2315@yahoo.com',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              // Container(
              //   height: 50,
              //   child: ListView.builder(
              //       itemCount: 5,
              //       itemBuilder: (context, index){
              //         return GestureDetector(
              //           behavior: HitTestBehavior.translucent,
              //           onTap: () {
              //
              //           },
              //           child: Container(
              //             //margin: EdgeInsets.only(top: 5.0),
              //             padding: EdgeInsets.all(10),
              //             child: Row(
              //               children: <Widget>[
              //                 Text(
              //                   'jhenanne2315@yahoo.com',
              //                   style:
              //                   TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );

  }
}