import 'package:flutter/material.dart';
import 'package:wstar_retailer/home/main_screen.dart';
import 'package:wstar_retailer/login/login_pincode_screen.dart';
import 'package:wstar_retailer/login/login_screen.dart';
import 'package:wstar_retailer/pages/main_dashboard_page.dart';
import 'package:wstar_retailer/splash_screen.dart';

import 'login/login_email_screen.dart';
import 'login/login_pin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: LoginEmailScreen(),
    );
  }
}
