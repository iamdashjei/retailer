import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Messaging extends StatelessWidget {
  Messaging({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(10.0, 599.0),
            child: Container(
              width: 297.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 607.0),
            child: Text(
              'Write message here...',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff959595),
                height: 0.9285714285714286,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 129.0),
            child: Container(
              width: 78.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xffd9d9d9),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 132.0),
            child: Text(
              'Hello Sir!\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff000000),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(210.0, 165.0),
            child: Container(
              width: 134.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff0a85e2),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(232.0, 169.0),
            child: Text(
              'Hi Sir, Kamusta?\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 201.0),
            child: Container(
              width: 283.0,
              height: 67.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xffd9d9d9),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(23.0, 205.0),
            child: Text(
              'Nakausap mo na ba ung group natin dyan\nregarding sa napagusapan natin para sa\nseminar?\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff000000),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(15.0, 274.0),
            child: Container(
              width: 153.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xffd9d9d9),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(23.0, 279.0),
            child: Text(
              'Tell them its free, OK?\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff000000),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(133.0, 337.0),
            child: Container(
              width: 211.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff0a85e2),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(147.0, 341.0),
            child: Text(
              'Yes sir,, as of now, madame na\nnaman ang nagconfirm saakin.\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(72.0, 391.0),
            child: Container(
              width: 272.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff0a85e2),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(84.0, 394.0),
            child: Text(
              'Wait ko lang final number of participants\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(107.0, 427.0),
            child: Container(
              width: 237.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff0a85e2),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(249.0, 499.0),
            child: Container(
              width: 95.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xff0a85e2),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(119.0, 431.0),
            child: Text(
              'tapos inform ko na po kayo. thanks\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(262.0, 504.0),
            child: Text(
              'See you Sir!\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xffffffff),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 462.0),
            child: Container(
              width: 42.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: const Color(0xffd9d9d9),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 467.0),
            child: Text(
              'OK\n',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff000000),
                height: 1.2857142857142858,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(128.0, 96.0),
            child: Text(
              'August 14, 2019 5:06 PM',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 10,
                color: const Color(0xffc8c8c8),
                height: 1.3,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(128.0, 314.0),
            child: Text(
              'August 14, 2019 7:24 PM',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 10,
                color: const Color(0xffc8c8c8),
                height: 1.3,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(313.0, 604.0),
            child: Container(
              width: 38.0,
              height: 26.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: 360.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: const Color(0xff0b1043),
            ),
          ),
          Transform.translate(
            offset: Offset(-8.0, 44.0),
            child: Container(
              width: 373.0,
              height: 45.0,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Container(
            width: 48.0,
            height: 44.0,
            decoration: BoxDecoration(),
          ),
          Transform.translate(
            offset: Offset(138.0, 13.0),
            child: SizedBox(
              width: 84.0,
              child: Text(
                'Chatroom',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                  height: 0.6666666666666666,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 48.0,
            height: 44.0,
            decoration: BoxDecoration(),
          ),
          Transform.translate(
            offset: Offset(35.0, 57.0),
            child: Text(
              'James Lacuarta Jr.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff505050),
                fontWeight: FontWeight.w700,
                height: 0.9285714285714286,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 59.0),
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff1fae1a),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(342.0, 520.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(342.0, 448.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(342.0, 412.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(342.0, 376.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(342.0, 186.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(348.0, 520.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(348.0, 448.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(348.0, 412.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(348.0, 376.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(348.0, 186.0),
            child: Transform.rotate(
              angle: -0.1047,
              child: Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(324.0, 57.0),
            child: Container(
              width: 19.0,
              height: 19.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
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
                color: const Color(0xff0b1043),
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
                color: const Color(0xffffaa00),
                height: 1.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(13.5, 16.5),
            child: SizedBox(
              width: 18.0,
              height: 14.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 7.0, 17.8, 1.0),
                    size: Size(17.8, 14.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_v6cxzk,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 7.0, 7.0),
                    size: Size(17.8, 14.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_rxz1ud,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 7.0, 7.0, 7.0),
                    size: Size(17.8, 14.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_qi6lix,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_v6cxzk =
    '<svg viewBox="12.5 27.5 17.8 1.0" ><path transform="translate(12.5, 27.5)" d="M 0 0 L 17.81689453125 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_rxz1ud =
    '<svg viewBox="12.5 20.5 7.0 7.0" ><path transform="translate(12.5, 20.5)" d="M 0 7 L 7 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_qi6lix =
    '<svg viewBox="12.5 27.5 7.0 7.0" ><path transform="translate(12.5, 27.5)" d="M 0 0 L 7 7" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
