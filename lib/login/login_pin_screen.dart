import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:flutter/services.dart';
import 'package:wstar_retailer/pages/main_dashboard_page.dart';
import 'package:wstar_retailer/util/hex_color.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  bool isFingerprint = false;


  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: HexColor("#0B1043"),
      //   centerTitle: true,
      //   title: Text("Profile"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
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
              Center(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("cashier123@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Colors.grey),),
                    SizedBox(width: 5),
                    Text("Change Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  ],
                ),
              ),
              Container(
                height: 700,
                width: 450,
                child: LockScreen(
                    numColor: HexColor("#0B1043"),
                    title: "Enter your 4-digit PIN",
                    passLength: myPass.length,
                    bgImage: "assets/images/whitebg.png",
                    borderColor: HexColor("#0B1043"),
                    showWrongPassDialog: true,
                    wrongPassContent: "Wrong pass please try again.",
                    wrongPassTitle: "Opps!",
                    wrongPassCancelButtonText: "Cancel",
                    passCodeVerify: (passcode) async {
                      for (int i = 0; i < myPass.length; i++) {
                        if (passcode[i] != myPass[i]) {
                          return false;
                        }
                      }

                      return true;
                    },
                    onSuccess: () {
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(builder: (BuildContext context) {
                            return MainDashboardPage();
                          }));
                    }),
                padding: EdgeInsets.all(50.0),
              ),

            ],
          ),
        ),
      ),
    );

  }
}