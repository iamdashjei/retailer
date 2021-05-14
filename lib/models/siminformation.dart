import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

class SIMInformation{

  String key;
  String date;
  String barcodeNumber;
  double amount;
  int transactTimestamp;
  String uid;
  String uidReceived;
  String generatedKey;
  String status;

  SIMInformation({this.date, this.barcodeNumber, this.amount, this.uid, this.uidReceived, this.transactTimestamp, this.status, this.generatedKey});

  SIMInformation.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        date = dataSnapshot.value["date"].toString(),
        barcodeNumber = dataSnapshot.value["barcodeNumber"],
        amount = double.parse(dataSnapshot.value["amount"].toString()),
        uidReceived = dataSnapshot.value["uidReceived"],
        generatedKey = dataSnapshot.value["generatedKey"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "date": date,
      "barcodeNumber": barcodeNumber,
      "amount": amount,
      "uidReceived": uidReceived,
      "generatedKey": generatedKey,
      "transactTimestamp": transactTimestamp,
      "status": status,
    };
  }

}

class LoadInformation {
  String key;
  String date;
  String mobileNumber;
  double amount;
  String offerDescription;
  int transactTimestamp;
  String uid;
  String uidReceived;
  String generatedKey;
  String status;

  LoadInformation({this.date, this.mobileNumber, this.amount, this.offerDescription, this.uid, this.uidReceived, this.transactTimestamp, this.status, this.generatedKey});

  LoadInformation.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        date = dataSnapshot.value["date"].toString(),
        mobileNumber = dataSnapshot.value["mobileNumber"],
        amount = double.parse(dataSnapshot.value["amount"].toString()),
        offerDescription = dataSnapshot.value["offerDescription"],
        uidReceived = dataSnapshot.value["uidReceived"],
        generatedKey = dataSnapshot.value["generatedKey"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "date": date,
      "mobileNumber": mobileNumber,
      "amount": amount,
      "offerDescription": offerDescription,
      "uidReceived": uidReceived,
      "generatedKey": generatedKey,
      "transactTimestamp": transactTimestamp,
      "status": status,
    };
  }

// Map<String, dynamic> toJsonKey() {
//   return {
//     "uid": uid,
//     "key": key,
//     "date": date,
//     "mobileNumber": mobileNumber,
//     "amount": amount,
//     "offerDescription": offerDescription,
//     "transactTimestamp": transactTimestamp,
//     "status": status,
//   };
// }
}

class PurchaseOrderDetails{

  String key;
  String businessName;
  String poDate;
  String poType;
  double poValue;
  int transactTimestamp;
  String uid;
  String uidReceived;
  String status;
  Map<dynamic, dynamic> itemGenerated = new HashMap<dynamic, dynamic>();
  int countGenerated;

  PurchaseOrderDetails({this.poDate, this.poType, this.poValue, this.status, this.uid, this.transactTimestamp, this.uidReceived, this.itemGenerated, this.countGenerated, this.businessName});

  PurchaseOrderDetails.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        businessName = dataSnapshot.value["businessName"].toString(),
        poDate = dataSnapshot.value["poDate"].toString(),
        poValue = double.parse(dataSnapshot.value["poValue"].toString()),
        poType = dataSnapshot.value["poType"],
        uidReceived = dataSnapshot.value["uidReceived"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        itemGenerated = dataSnapshot.value["itemGenerated"] != null ? dataSnapshot.value["itemGenerated"] : null,
        countGenerated = dataSnapshot.value["countGenerated"] != null ? int.parse(dataSnapshot.value["countGenerated"].toString()) : 0,
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "businessName": businessName,
      "poDate": poDate,
      "poValue": poValue,
      "poType": poType,
      "uidReceived": uidReceived,
      "itemGenerated": itemGenerated,
      "countGenerated": countGenerated,
      "transactTimestamp": transactTimestamp,
      "status": status,
    };
  }
}

class PurchaseOrderAPI{
  int id;
  int buyerId;
  double amount;
  int quantity;
  String status;
  String createdAt;
  String updatedAt;
  int sellerId;
  int itemId;
  double itemPrice;
  String receivedAt;


  PurchaseOrderAPI({
    this.id,
    this.buyerId,
    this.amount,
    this.quantity,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.sellerId,
    this.itemId,
    this.itemPrice,
    this.receivedAt
  });

  factory PurchaseOrderAPI.fromJson(Map<String, dynamic> json){
    return PurchaseOrderAPI(
        id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
        buyerId: json['buyer_id'] != null ? int.parse(json['buyer_id'].toString()) : 0,
        amount: json['amount'] != null ? double.parse(json['amount'].toString()) : 0,
        quantity: json['qty'] != null ? int.parse(json['qty'].toString()) : 0,
        status: json['status'] != null ? json['status'] : "",
        createdAt: json['created_at'] != null ? json['created_at'] : "",
        updatedAt: json['updated_at'] != null ? json['updated_at'] : "",
        sellerId: json['seller_id'] != null ? int.parse(json['seller_id'].toString()) : 0,
        itemId: json['item_id'] != null ? int.parse(json['item_id'].toString()) : 0,
        itemPrice: json['item_price'] != null ? double.parse(json['item_price'].toString()) : 0,
        receivedAt: json['received_at'] != null ? json['received_at'].toString() : ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "buyer_id": buyerId,
      "amount": amount,
      "qty": quantity,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "seller_id": sellerId,
      "item_id": itemId,
      "item_price": itemPrice,
      "received_at": receivedAt,
    };
  }




}