import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YearCalendar extends StatelessWidget {
  YearCalendar({
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
            child: Container(
              width: 340.0,
              height: 369.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(80.0, 477.0),
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
            offset: Offset(205.0, 477.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 75.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xff0c9e1f),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 485.0),
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
          Transform.translate(
            offset: Offset(233.0, 485.0),
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
          Transform.translate(
            offset: Offset(268.9, 185.3),
            child: SvgPicture.string(
              _svg_19pqun,
              allowDrawingOutsideViewBox: true,
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
                color: const Color(0xff1fae1a),
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
                color: const Color(0xff1fae1a),
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
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
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
                color: const Color(0xffffffff),
                border: Border.all(width: 0.5, color: const Color(0xff707070)),
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
            offset: Offset(32.3, 249.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2017',
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
            offset: Offset(32.3, 330.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2021',
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
            offset: Offset(32.3, 412.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2025',
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
            offset: Offset(114.3, 249.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2018',
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
            offset: Offset(114.3, 330.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2022',
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
            offset: Offset(114.3, 412.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2026',
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
            offset: Offset(196.3, 249.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2019',
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
            offset: Offset(196.3, 330.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2023',
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
            offset: Offset(196.3, 412.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2027',
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
            offset: Offset(279.3, 249.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2020',
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
            offset: Offset(279.3, 330.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2024',
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
            offset: Offset(279.3, 412.0),
            child: SizedBox(
              width: 40.0,
              child: Text(
                '2028',
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

const String _svg_19pqun =
    '<svg viewBox="268.9 185.3 58.3 5.6" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, -1593.92, 7862.38)" d="M -7677.0322265625 -1921.165771484375 L -7671.41015625 -1915.543701171875 L -7677.0322265625 -1909.8583984375" fill="none" stroke="#373737" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.0, -1.0, 1.0, 0.0, 2190.1, -7486.07)" d="M -7677.0322265625 -1921.165771484375 L -7671.41015625 -1915.543701171875 L -7677.0322265625 -1909.8583984375" fill="none" stroke="#373737" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
