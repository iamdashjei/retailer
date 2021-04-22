import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class POSLoadConfirm extends StatelessWidget {
  POSLoadConfirm({
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
            offset: Offset(10.0, 237.0),
            child: Container(
              width: 340.0,
              height: 272.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(68.0, 451.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 100.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffff0000),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(193.0, 451.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 100.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xff0c9e1f),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(102.0, 457.0),
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
            offset: Offset(215.0, 457.0),
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
            offset: Offset(20.0, 245.0),
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
            offset: Offset(20.0, 272.0),
            child: Container(
              width: 320.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 0.2, color: const Color(0xff373737)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 278.0),
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
            offset: Offset(317.5, 287.5),
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
            offset: Offset(20.0, 327.0),
            child: Text(
              'Amount',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff373737),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 351.0),
            child: Container(
              width: 340.0,
              height: 67.0,
              decoration: BoxDecoration(
                color: const Color(0xffe1e1e1),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(123.8, 354.0),
            child: SizedBox(
              width: 113.0,
              child: Text(
                '0.00',
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

const String _svg_qjc6fz =
    '<svg viewBox="315.5 112.5 5.0 5.0" ><path transform="translate(315.5, 112.5)" d="M 0 0 L 5 5" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_csaixt =
    '<svg viewBox="320.5 112.5 5.0 5.0" ><path transform="translate(320.5, 112.5)" d="M 5 0 L 0 5" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
