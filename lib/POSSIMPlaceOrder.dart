import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import './POSSIM.dart';
import 'package:flutter_svg/flutter_svg.dart';

class POSSIMPlaceOrder extends StatelessWidget {
  POSSIMPlaceOrder({
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
          PageLink(
            links: [
              PageLinkInfo(),
            ],
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(130.8, 15.0),
            child: SizedBox(
              width: 98.0,
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 64.0),
            child: Text(
              'Retailer',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
                height: 3.75,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 146.0),
            child: Text(
              'Total SIM QTY',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
                height: 3.75,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 214.0),
            child: Text(
              'Total Amount',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
                height: 3.75,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 91.0),
            child: Container(
              width: 340.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 97.0),
            child: Text(
              'Select One',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xffaeaeae),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 173.0),
            child: Text(
              '31 pcs.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 241.0),
            child: Text(
              'PhP 1,209',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(331.5, 106.5),
            child: SizedBox(
              width: 10.0,
              height: 5.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 5.0, 5.0),
                    size: Size(10.0, 5.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: SvgPicture.string(
                      _svg_qjc6fz,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(5.0, 0.0, 5.0, 5.0),
                    size: Size(10.0, 5.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: SvgPicture.string(
                      _svg_csaixt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 282.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => POSSIM(),
                ),
              ],
              child: Container(
                width: 340.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xff1fae1a),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(164.0, 288.0),
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

const String _svg_qjc6fz =
    '<svg viewBox="315.5 112.5 5.0 5.0" ><path transform="translate(315.5, 112.5)" d="M 0 0 L 5 5" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_csaixt =
    '<svg viewBox="320.5 112.5 5.0 5.0" ><path transform="translate(320.5, 112.5)" d="M 5 0 L 0 5" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v6cxzk =
    '<svg viewBox="12.5 27.5 17.8 1.0" ><path transform="translate(12.5, 27.5)" d="M 0 0 L 17.81689453125 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_rxz1ud =
    '<svg viewBox="12.5 20.5 7.0 7.0" ><path transform="translate(12.5, 20.5)" d="M 0 7 L 7 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_qi6lix =
    '<svg viewBox="12.5 27.5 7.0 7.0" ><path transform="translate(12.5, 27.5)" d="M 0 0 L 7 7" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
