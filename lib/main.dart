import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wstar_retailer/pages/main_dashboard_page.dart';
import 'package:wstar_retailer/util/hex_color.dart';

import 'login/login_email_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key key, this.isLoggedIn}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      // home: SplashScreen(
      //     seconds: 5,
      //     photoSize: 200,
      //     navigateAfterSeconds: LoginEmailScreen(),
      //     title: new Text(
      //       'Welcome to WStar Retailer App!',
      //       style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      //     ),
      //     image: Image.asset("assets/images/splash_image.png"),
      //     backgroundColor: Colors.white,
      //     loaderColor: HexColor("#0B1043"),
      //   ),
      home: isLoggedIn ? SplashScreen(
              seconds: 5,
              photoSize: 200,
              navigateAfterSeconds: MainDashboardPage(),
              title: new Text(
                'Welcome to WStar Retailer App!',
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              image: Image.asset("assets/images/splash_image.png"),
              backgroundColor: Colors.white,
              loaderColor: HexColor("#0B1043"),
            ) : SplashScreen(
        seconds: 5,
        photoSize: 200,
        navigateAfterSeconds: LoginEmailScreen(),
        title: new Text(
          'Welcome to WStar Retailer App!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset("assets/images/splash_image.png"),
        backgroundColor: Colors.white,
        loaderColor: HexColor("#0B1043"),
      ),
    );
  }
}
