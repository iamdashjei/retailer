import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wstar_retailer/models/dito_user.dart';
import 'package:wstar_retailer/pages/main_dashboard_page.dart';
import 'package:wstar_retailer/services/Session.dart';
import 'package:wstar_retailer/services/storage.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'package:http/http.dart' as http;

import 'login_email_screen.dart';

class LoginPinCodeScreen extends StatefulWidget {
  final String email;

  LoginPinCodeScreen({Key key, @required this.email}) : super(key: key);
  @override
  LoginPinCodeState createState() => LoginPinCodeState();
}

class LoginPinCodeState extends State<LoginPinCodeScreen>{
  bool isFirstPin = false, isSecondPin = false, isThirdPin = false, isFourthPin = false, isFifthPin = false, isSixthPin = false;
  String firstPin = "", secondPin = "", thirdPin = "", fourthPin = "", fifthPin = "", sixthPin = "";
  String allPinCombined = "";
  String pinCode = "123456";

  SharedPreferences pref;

  final databaseReference = FirebaseDatabase.instance.reference();
  final SecureStorage secureStorage = SecureStorage();

  StreamSubscription<Event> _onRetailerAdded;
  StreamSubscription<Event>  _onRetailUpdate;
  Query _todoQuery;
  Map<String, String> emailAndPin = new HashMap<String, String>();
  Map<String, String> emailAndStatus = new HashMap<String, String>();
  Map<String, String> emailAndUID = new HashMap<String, String>();

  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    _todoQuery = databaseReference.reference().child("retailers");
    _onRetailerAdded = _todoQuery.onChildAdded.listen(onEntryRetailerAdded);
    _onRetailUpdate = _todoQuery.onChildChanged.listen(onEntryRetailerChanged);

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _onRetailerAdded.cancel();
    _onRetailUpdate.cancel();
  }

  loadData() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<DitoUser> login(String uid, String pinCode) async {

    var body = new Map<String, dynamic>();
    body['uid'] = uid;
    body['password'] = pinCode;

    final response = await http.post(
      Uri.https('api.wstarict.com', 'api/v1/public/login'), body: body
    );

    print("Status code => "+ response.statusCode.toString());
    //print("json body "+ response.body);
    if(response.statusCode == 200){
      //print(response.body);
      var data = json.decode(response.body);
      DitoUser ditoUser = DitoUser.fromJson(data);
      //String jsonUser = jsonEncode(ditoUser);

      //print(ditoUser.details.assignedTeamsSubd);
      //print(ditoUser.details.assignedTeamsDsp);
      Session.setDitoUserDetails(user: response.body);
      secureStorage.writeSecureData(key: 'token', value: ditoUser.accessToken);

      //var testData = jsonDecode(response.body);
      //DitoUser newDitoUser = DitoUser.fromJson(testData);
      //print(data);
      //print(testData);
      //Map<String, dynamic> testMap = new HashMap<String, dynamic>();
      //testMap.putIfAbsent("access_token", () => ditoUser.accessToken);
      //print(testMap);
      //DitoUser newUser = DitoUser.fromJson(testData);
      // print(newUser.toJson());
      isSuccess = true;
      return ditoUser;
    } else {
      isSuccess = false;
      throw Exception('Login Failure');

    }
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            LoginEmailScreen()), (Route<dynamic> route) => false);
                      },
                      child: Text('Change UID', style: TextStyle(color: Color(0xFF0B1043)),),
                    ),

                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text('Enter your 6 digit PIN', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0B1043))),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
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
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.07,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color:  isFifthPin == true ? HexColor("#0B1043") : Colors.white,
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
                          color:  isSixthPin == true ? HexColor("#0B1043") : Colors.white,
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

  void verifyPin(String input, BuildContext context) async {
    print("Verifying " + allPinCombined);
    setState(() {
      if(input == "del"){
        if(isFirstPin == true && isSecondPin == false && isThirdPin == false && isFourthPin == false && isFifthPin == false && isSixthPin == false){
          isFirstPin = false;
          firstPin = "";
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == false && isFourthPin == false && isFifthPin == false && isSixthPin == false){
          isSecondPin = false;
          secondPin = "";
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == false && isFifthPin == false && isSixthPin == false){
          isThirdPin = false;
          thirdPin = "";
          // 123 -> 12
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == false && isSixthPin == false){
          isFourthPin = false;
          fourthPin = "";
          // 1234 -> 123
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == true && isSixthPin == false){
          isFourthPin = false;
          fifthPin = "";
          // 123 -> 1234
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == true && isSixthPin == true){
          isFourthPin = false;
          sixthPin = "";
          // 12345 -> 1234
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
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == false){
          isFifthPin = true;
          fifthPin = input;
        } else if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == true && isSixthPin == false){
          isSixthPin = true;
          sixthPin = input;
        }
        allPinCombined = firstPin + secondPin + thirdPin + fourthPin + fifthPin + sixthPin;
      }


    });
    if(allPinCombined.length == 6){
      DitoUser user = await login(widget.email, allPinCombined);
      if(isSuccess){
        pref.setBool("isLoggedIn", true);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            MainDashboardPage()), (Route<dynamic> route) => false);
      } else {
        if(isFirstPin == true && isSecondPin == true && isThirdPin == true && isFourthPin == true && isFifthPin == true && isSixthPin == true){
          showAlertDialog(context);
        }
      }
    }
    //print(emailAndPin.values.toString());
    // if(allPinCombined == pinCode){
    //   print("Enter now");
    //
    //
    // } else {
    //
    //
    // }

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
      title: Text("Try again"),
      content: Text("Sorry you have entered wrong pin."),
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

  onEntryRetailerAdded(Event event) {

    if(event.snapshot.value != null){
      setState(() {
        emailAndPin.putIfAbsent(event.snapshot.value["email"].toString(), () => event.snapshot.value["pin"].toString());
        emailAndStatus.putIfAbsent(event.snapshot.value["email"].toString(), () => event.snapshot.value["activatedStatus"].toString());
        emailAndUID.putIfAbsent(event.snapshot.value["email"].toString(), () => event.snapshot.value["uid"].toString());
      });


    }

    //print("IDS => " + onlineIds.values.toString());
  }

  onEntryRetailerChanged(Event event) {

    if(event.snapshot.value != null){
      // print(event.snapshot.value["status"]);
      setState(() {
        emailAndPin.update(event.snapshot.value["email"].toString(), (v) => event.snapshot.value["pin"].toString());
        emailAndStatus.update(event.snapshot.value["email"].toString(), (v) => event.snapshot.value["activatedStatus"].toString());
        emailAndUID.update(event.snapshot.value["email"].toString(), (v) => event.snapshot.value["uid"].toString());
      });

    }
  }


}

