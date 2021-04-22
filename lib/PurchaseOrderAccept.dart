import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class PurchaseOrderAccept extends StatelessWidget {
  PurchaseOrderAccept({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 110.0),
            child: Container(
              width: 360.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xd1ffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(159.0, 119.0),
            child: SizedBox(
              width: 42.0,
              height: 42.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 42.0, 42.0),
                    size: Size(42.0, 42.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 42.0, 42.0),
                          size: Size(42.0, 42.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff1fae1a),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(9.0, 13.0, 24.0, 18.0),
                    size: Size(42.0, 42.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
