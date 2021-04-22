import 'package:flutter/material.dart';
import './LoginScreen4.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen5 extends StatelessWidget {
  LoginScreen5({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(102.0, 281.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Container(
                width: 156.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xffffaa00),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(165.0, 290.0),
            child: Text(
              'NEXT',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 12,
                color: const Color(0xff0b1043),
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 164.0),
            child: Text(
              'Enter your New E-mail Address',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff0b1043),
                height: 3.3333333333333335,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 367.0),
            child: Text(
              'Or use Existing E-mail Address (Select One)',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff0b1043),
                height: 3.3333333333333335,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(7.0, 236.0),
            child: Text(
              'Make sure your e-mail is registered by your Master Dealer',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff0b1043),
                height: 4.166666666666667,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 190.0),
            child: Container(
              width: 360.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: const Color(0xffe1e1e1),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 196.0),
            child: Text(
              'Type here',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 25,
                color: const Color(0x33000000),
                fontWeight: FontWeight.w700,
                height: 0.4,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(75.0, 29.0),
            child: Container(
              width: 210.0,
              height: 93.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 405.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Text(
                'jhenanne2315@yahoo.com',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff373737),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  height: 4.0625,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(13.0, 446.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Text(
                'rica123santos@gmail.com',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff373737),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  height: 4.0625,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(11.0, 489.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Text(
                'alingrosie1976@yahoo.com',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff373737),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  height: 4.0625,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 526.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Text(
                'lovemeorhateme143@yahoo.com',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff373737),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  height: 4.0625,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(13.0, 567.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginScreen4(),
                ),
              ],
              child: Text(
                'rickysantos89@gmail.com',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff373737),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  height: 4.0625,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 395.0),
            child: SvgPicture.string(
              _svg_ua9ypb,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ua9ypb =
    '<svg viewBox="10.0 395.0 341.0 203.0" ><path transform="translate(10.0, 395.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 436.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 477.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 518.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(11.0, 557.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(10.0, 598.0)" d="M 0 0 L 153.3984375 0 L 340 0" fill="none" stroke="#707070" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
