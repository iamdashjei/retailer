import 'package:flutter/material.dart' ;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ChatRoomScreen extends StatefulWidget {
  final PersistentTabController persistentTabController;
  ChatRoomScreen({Key key, this.persistentTabController}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
