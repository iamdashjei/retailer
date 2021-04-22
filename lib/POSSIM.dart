import 'package:flutter/material.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
import 'POSLoad.dart';
import 'POSSIMList.dart';
//POSSIMList(),
class POSSIM extends StatefulWidget {
  @override
  _POSSIMPageState createState() => _POSSIMPageState();
}

class _POSSIMPageState extends State<POSSIM> with AutomaticKeepAliveClientMixin<POSSIM>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                labelColor: HexColor("#FFAA00"),
                unselectedLabelColor: HexColor("#0B1043"),
                indicatorColor: HexColor("#FFAA00"),
                tabs: [
                  Tab(icon: null, child: Text("Sim",
                      style: TextStyle(
                      fontSize: 20,
                    )),

                  ),
                  Tab(icon: null, child: Text("Load",
                    style: TextStyle(
                    fontSize: 20,

                  )
                  ),),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            POSSIMList(),
            POSLoad(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  
}
