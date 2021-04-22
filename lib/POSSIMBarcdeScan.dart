import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';

class POSSIMBarcdeScan extends StatelessWidget {
  POSSIMBarcdeScan({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-10.0, 45.0),
            child: Container(
              width: 360.0,
              height: 655.0,
              decoration: BoxDecoration(
                color: const Color(0x40000000),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 194.0),
            child: Container(
              width: 340.0,
              height: 313.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(121.0, 206.0),
            child: Text(
              'Scan Barcode',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff0b1043),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(93.0, 245.0),
            child: Container(
              width: 175.0,
              height: 175.0,
              decoration: BoxDecoration(
                color: const Color(0xffe1e1e1),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(143.0, 454.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 75.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffff0000),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(164.0, 460.0),
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
            offset: Offset(93.0, 245.0),
            child: Container(
              width: 175.0,
              height: 175.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
