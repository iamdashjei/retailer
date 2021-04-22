import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonthCalendar extends StatelessWidget {
  MonthCalendar({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 50.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 360.0,
                height: 650.0,
                decoration: BoxDecoration(
                  color: const Color(0x40000000),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 165.0),
            child: SizedBox(
              width: 340.0,
              height: 369.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 340.0, 369.0),
                    size: Size(340.0, 369.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(70.0, 312.0, 75.0, 35.0),
                    size: Size(340.0, 369.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                        PageLinkInfo(),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffff0000),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(195.0, 312.0, 75.0, 35.0),
                    size: Size(340.0, 369.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                        PageLinkInfo(),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xff0c9e1f),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(86.0, 320.0, 41.0, 19.0),
                    size: Size(340.0, 369.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(223.0, 320.0, 19.0, 19.0),
                    size: Size(340.0, 369.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(11.0, 13.0, 36.0, 20.0),
                    size: Size(340.0, 369.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '2021 ',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 15,
                        color: const Color(0xff373737),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(305.9, 20.3, 11.3, 5.6),
                    size: Size(340.0, 369.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_clubna,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(258.9, 20.3, 11.3, 5.6),
                    size: Size(340.0, 369.0),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_blw2v2,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 228.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 391.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 310.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(268.0, 228.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(268.0, 391.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(268.0, 310.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(103.0, 228.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xff1fae1a),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(103.0, 391.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(103.0, 310.0),
            child: Container(
              width: 61.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(186.0, 228.0),
            child: Container(
              width: 59.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xff1fae1a),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(186.0, 391.0),
            child: Container(
              width: 59.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(186.0, 310.0),
            child: Container(
              width: 59.0,
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(37.3, 249.0),
            child: SizedBox(
              width: 30.0,
              child: Text(
                'Jan',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xff373737),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(34.3, 330.0),
            child: SizedBox(
              width: 36.0,
              child: Text(
                'May',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(36.3, 412.0),
            child: SizedBox(
              width: 32.0,
              child: Text(
                'Sep',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(118.3, 249.0),
            child: SizedBox(
              width: 32.0,
              child: Text(
                'Feb',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(119.3, 330.0),
            child: SizedBox(
              width: 30.0,
              child: Text(
                'Jun',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(118.3, 412.0),
            child: SizedBox(
              width: 32.0,
              child: Text(
                'Oct',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(199.3, 249.0),
            child: SizedBox(
              width: 34.0,
              child: Text(
                'Mar',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(203.3, 330.0),
            child: SizedBox(
              width: 26.0,
              child: Text(
                'Jul',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(198.3, 412.0),
            child: SizedBox(
              width: 36.0,
              child: Text(
                'Nov',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(283.3, 249.0),
            child: SizedBox(
              width: 32.0,
              child: Text(
                'Apr',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xff373737),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(282.3, 330.0),
            child: SizedBox(
              width: 34.0,
              child: Text(
                'Aug',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(282.3, 412.0),
            child: SizedBox(
              width: 34.0,
              child: Text(
                'Dec',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 15,
                  color: const Color(0xffe1e1e1),
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

const String _svg_clubna =
    '<svg viewBox="310.9 104.3 11.3 5.6" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, -1598.92, 7781.38)" d="M -7677.0322265625 -1921.165771484375 L -7671.41015625 -1915.543701171875 L -7677.0322265625 -1909.8583984375" fill="none" stroke="#373737" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_blw2v2 =
    '<svg viewBox="263.9 104.3 11.3 5.6" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 2185.1, -7567.07)" d="M -7677.0322265625 -1921.165771484375 L -7671.41015625 -1915.543701171875 L -7677.0322265625 -1909.8583984375" fill="none" stroke="#373737" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
