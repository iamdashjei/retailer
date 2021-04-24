import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wstar_retailer/pages/main_dashboard_page.dart';
import 'package:wstar_retailer/util/hex_color.dart';

class LoginPinCodeScreen extends StatefulWidget {
  final String email;

  LoginPinCodeScreen({Key key, @required this.email}) : super(key: key);
  @override
  LoginPinCodeState createState() => LoginPinCodeState();
}

class LoginPinCodeState extends State<LoginPinCodeScreen>{
  bool isFirstPin = false, isSecondPin = false, isThirdPin = false, isFourthPin = false;
  String firstPin = "", secondPin = "", thirdPin = "", fourthPin = "";
  String allPinCombined = "";
  SharedPreferences pref;


  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
    pref = await SharedPreferences.getInstance();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/splash_image.png',
                    height: 150.0,
                    width: 200.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.email, style: TextStyle(color: Colors.grey), maxLines: 2,),
                    SizedBox(width: 2,),
                    Text('Change E-mail', style: TextStyle(color: Color(0xFF0B1043)),),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text('Enter your 4 digit PIN', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0B1043))),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // PinCodeHolder(height: height, width: width, selectedIndex: selectedIndex, index: 0,),
                    // PinCodeHolder(height: height, width: width, selectedIndex: selectedIndex, index: 1,),
                    // PinCodeHolder(height: height, width: width, selectedIndex: selectedIndex, index: 2,),
                    // PinCodeHolder(height: height, width: width, selectedIndex: selectedIndex, index: 3,),
                    Container(
                      height: height * 0.07,
                      width: width * 0.07,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: isFirstPin == true ? HexColor("#0B1043") : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF0B1043)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfff2f2f2),
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.25, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ]
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.07,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: isSecondPin == true ? HexColor("#0B1043") : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF0B1043)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfff2f2f2),
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.25, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ]
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.07,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: isThirdPin == true ? HexColor("#0B1043") : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF0B1043)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfff2f2f2),
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.25, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ]
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.07,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color:  isFourthPin == true ? HexColor("#0B1043") : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF0B1043)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfff2f2f2),
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.25, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ]
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("1", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('1', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("2", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('2', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("3", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('3', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("4", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('4', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("5", context);
                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('5', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;

                        verifyPin("6", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('6', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("7", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('7', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("8", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('8', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("9", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('9', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.10,
                      width: width * 0.18,
                      child: Center(child: Text('_', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.25, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("0", context);
                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Text('0', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40), )),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(!mounted) return;
                        verifyPin("del", context);

                      },
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.18,
                        child: Center(child: Icon(Icons.arrow_back, color: Colors.white, size: 30,) ),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B1043),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF0B1043)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff2f2f2),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.25, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 20.0),
                Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 150, height: 40),
                      child: ElevatedButton(onPressed: (){},
                        child: Text('Forgot Password?',  style: TextStyle(fontSize: 12, color: Colors.black),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFAA00)),
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyPin(String input, BuildContext context){
    setState(() {
      if(input == "del"){
        if(isFirstPin == true && isSecondPin == false && isThirdPin == false && isFourthPin == false){
          isFirstPin = false;
          firstPin = "";
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == false && isFourthPin == false){
          isSecondPin = false;
          secondPin = "";
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == false){
          isThirdPin = false;
          thirdPin = "";
          // 123 -> 12
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true){
          isFourthPin = false;
          fourthPin = "";
          // 1234 -> 123
        }
      } else {
        if(isFirstPin == false){
          isFirstPin = true;
          firstPin = input;
        } else if(isFirstPin == true && isSecondPin == false){
          isSecondPin = true;
          secondPin = input;
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == false){
          isThirdPin = true;
          thirdPin = input;
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == false){
          isFourthPin = true;
          fourthPin = input;
        }
        allPinCombined = firstPin + secondPin + thirdPin + fourthPin;
      }


    });

    if(allPinCombined == "1234"){
      pref.setBool("isLoggedIn", true);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MainDashboardPage(),
      ));
    } else {
      if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true){
        showAlertDialog(context);
      }

    }
  }

  showAlertDialog(BuildContext context){
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WStar Retailer"),
      content: Text("Wrong pin code. Please Try again."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

