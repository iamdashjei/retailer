import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Container(
            child: Image.asset('assets/images/splash_image.png', height: 500,width: 500.0,),
          ),
        )
      ),
    );
  }
}
