import 'package:flutter/material.dart';

class PurchaseOrderSIM extends StatelessWidget {
  PurchaseOrderSIM({
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
            offset: Offset(10.0, 176.0),
            child: Container(
              width: 340.0,
              height: 288.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 410.0),
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
            offset: Offset(205.0, 410.0),
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
            offset: Offset(25.0, 206.0),
            child: Container(
              width: 141.0,
              height: 51.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff0b1043),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(194.0, 206.0),
            child: Container(
              width: 141.0,
              height: 51.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(101.0, 416.0),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(214.0, 416.0),
            child: Text(
              'Confirm',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(68.0, 212.0),
            child: Text(
              'SIM',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(231.0, 212.0),
            child: Text(
              'Load',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: const Color(0xff373737),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 278.0),
            child: Text(
              'QTY',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: const Color(0xff373737),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 312.0),
            child: Container(
              width: 340.0,
              height: 67.0,
              decoration: BoxDecoration(
                color: const Color(0xffe1e1e1),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(142.8, 316.0),
            child: SizedBox(
              width: 75.0,
              child: Text(
                '50',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 45,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  height: 0.2222222222222222,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
