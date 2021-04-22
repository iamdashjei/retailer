import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BulletinScreen extends StatefulWidget {
  final PersistentTabController persistentTabController;
  BulletinScreen({Key key, this.persistentTabController}) : super(key: key);


  @override
  _BulletinScreenState createState() => _BulletinScreenState();
}

class _BulletinScreenState extends State<BulletinScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
