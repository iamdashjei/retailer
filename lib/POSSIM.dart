import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wstar_retailer/pages/sales/sales.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'Bulletin.dart';
import 'Chatroom.dart';
import 'POSLoad.dart';
import 'POSSIMList.dart';
import 'models/retailer.dart';
//POSSIMList(),
class POSSIM extends StatefulWidget {
  final String myUID;

  const POSSIM({Key key, this.myUID}) : super(key: key);
  @override
  _POSSIMPageState createState() => _POSSIMPageState();
}

class _POSSIMPageState extends State<POSSIM> with AutomaticKeepAliveClientMixin<POSSIM>{

  DatabaseReference updateMyInfo;
  double amount = 0;

  @override
  void initState() {
    super.initState();
    updateMyInfo = FirebaseDatabase.instance.reference().child("retailers");
    getMyInfo();

  }

  @override
  void dispose() {
    super.dispose();
  }

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
            POSSIMList(myUID: widget.myUID),
            POSLoad(myUID: widget.myUID, balance: amount),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  void getMyInfo() async {
    TransactionResult transactionResult = await updateMyInfo.child(widget.myUID).runTransaction((MutableData mutableData) async {
      return mutableData;
    });

    Retailer info = Retailer.fromSnapshot(transactionResult.dataSnapshot);
    setState(() {
      amount = info.loadBalance;
    });


  }


}
