import 'package:flutter/material.dart';

class PaymentConfirmation1 extends StatelessWidget {
  PaymentConfirmation1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 45.0),
            child: Container(
              width: 360.0,
              height: 655.0,
              decoration: BoxDecoration(
                color: const Color(0x40000000),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 243.0),
            child: Container(
              width: 340.0,
              height: 132.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(133.0, 269.0),
            child: Text(
              'Are you sure?',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15,
                color: const Color(0xff373737),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 307.0),
            child: Container(
              width: 75.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xffff0000),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(205.0, 307.0),
            child: Container(
              width: 75.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff0c9e1f),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(108.0, 315.0),
            child: Text(
              'No',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(233.0, 315.0),
            child: Text(
              'Yes',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
