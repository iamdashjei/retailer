import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RetailerList extends StatelessWidget {
  RetailerList({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 360.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xff080b2f),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(),
          ),
          Transform.translate(
            offset: Offset(10.0, 168.0),
            child: SvgPicture.string(
              _svg_l34iq0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(9.0, 127.0),
            child: Text(
              'ABC Store\nDIY Hardware\nJane Macapinlac\nRobert Estacio\nKim Caparal\nMang Jose Sari-Sari\nRicky Castenedas\nAling Jane Store\nSide Mcdo-1\nWilcon Depot\n',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 16,
                color: const Color(0xff373737),
                height: 3.75,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(264.8, 127.0),
            child: SizedBox(
              width: 85.0,
              child: Text(
                ' 2,560.00 \n 2,985.00 \n 3,510.00 \n 3,655.00 \n 3,780.00 \n 3,970.00 \n 4,850.00 \n 5,120.00 \n 5,920.00 \n 7,230.00 \n',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 16,
                  color: const Color(0xffff0000),
                  height: 3.75,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(135.0, 15.0),
            child: Text(
              'Retailer List',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15,
                color: const Color(0xffffffff),
                height: 1.2,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(14.5, 15.5),
            child: SizedBox(
              width: 20.0,
              height: 14.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 20.0, 1.0),
                    size: Size(20.0, 14.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_4vv23f,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 7.0, 20.0, 1.0),
                    size: Size(20.0, 14.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_u3dowd,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 14.0, 20.0, 1.0),
                    size: Size(20.0, 14.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_tv3pat,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(37.0, 71.0),
            child: SizedBox(
              width: 22.0,
              child: Text(
                'All',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(98.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff0c9e1f),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(187.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(275.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(121.0, 71.0),
            child: SizedBox(
              width: 28.0,
              child: Text(
                'Day',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(202.2, 71.0),
            child: SizedBox(
              width: 46.0,
              child: Text(
                'Month',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(298.0, 71.0),
            child: SizedBox(
              width: 30.0,
              child: Text(
                'Year',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(37.0, 71.0),
            child: SizedBox(
              width: 22.0,
              child: Text(
                'All',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(98.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff0c9e1f),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(187.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(275.0, 64.0),
            child: Container(
              width: 75.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(121.0, 71.0),
            child: SizedBox(
              width: 28.0,
              child: Text(
                'Day',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(202.2, 71.0),
            child: SizedBox(
              width: 46.0,
              child: Text(
                'Month',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(298.0, 71.0),
            child: SizedBox(
              width: 30.0,
              child: Text(
                'Year',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff0b1043),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(60.6, 653.0),
            child: SizedBox(
              width: 89.0,
              child: Text(
                'Kevin Pineda',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(214.2, 653.0),
            child: SizedBox(
              width: 82.0,
              child: Text(
                'April Moren',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(31.8, 669.0),
            child: SizedBox(
              width: 146.0,
              child: Text(
                'July 16, 2020 01:55 AM',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(183.0, 669.0),
            child: SizedBox(
              width: 144.0,
              child: Text(
                'July 17, 2020 04:38 PM',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 650.0),
            child: Container(
              width: 360.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, -3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(64.0, 659.0),
            child: Container(
              width: 24.7,
              height: 23.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(170.0, 659.0),
            child: Container(
              width: 20.9,
              height: 23.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(282.0, 659.0),
            child: Container(
              width: 25.3,
              height: 23.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(61.0, 682.0),
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 10,
                color: const Color(0xffffaa00),
                height: 1.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(161.0, 682.0),
            child: Text(
              'Bulletin',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 10,
                color: const Color(0xff0b1043),
                height: 1.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(270.0, 682.0),
            child: Text(
              'Chatroom',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 10,
                color: const Color(0xff0b1043),
                height: 1.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l34iq0 =
    '<svg viewBox="10.0 168.0 340.0 486.0" ><path transform="translate(10.0, 168.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 288.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 531.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 411.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 654.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 228.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 348.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 591.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 471.0)" d="M 0 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_4vv23f =
    '<svg viewBox="323.5 10.5 20.0 1.0" ><path transform="translate(323.5, 10.5)" d="M 0 0 L 20 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_u3dowd =
    '<svg viewBox="323.5 17.5 20.0 1.0" ><path transform="translate(323.5, 17.5)" d="M 0 0 L 20 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_tv3pat =
    '<svg viewBox="323.5 24.5 20.0 1.0" ><path transform="translate(323.5, 24.5)" d="M 0 0 L 20 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
