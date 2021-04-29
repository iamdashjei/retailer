import 'package:firebase_database/firebase_database.dart';

class SIMInformation{

  String key;
  String date;
  String barcodeNumber;
  double amount;
  int transactTimestamp;
  String uid;
  String uidReceived;
  String status;

  SIMInformation({this.date, this.barcodeNumber, this.amount, this.uid, this.uidReceived, this.transactTimestamp, this.status});

  SIMInformation.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        date = dataSnapshot.value["date"].toString(),
        barcodeNumber = dataSnapshot.value["barcodeNumber"],
        amount = double.parse(dataSnapshot.value["amount"].toString()),
        uidReceived = dataSnapshot.value["uidReceived"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "date": date,
      "barcodeNumber": barcodeNumber,
      "amount": amount,
      "uidReceived": uidReceived,
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
  String status;

  LoadInformation({this.date, this.mobileNumber, this.amount, this.offerDescription, this.uid, this.transactTimestamp, this.status});

  LoadInformation.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        date = dataSnapshot.value["date"].toString(),
        mobileNumber = dataSnapshot.value["mobileNumber"],
        amount = double.parse(dataSnapshot.value["amount"].toString()),
        offerDescription = dataSnapshot.value["offerDescription"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "date": date,
      "mobileNumber": mobileNumber,
      "amount": amount,
      "offerDescription": offerDescription,
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
  String poDate;
  String poType;
  double poValue;
  int transactTimestamp;
  String uid;
  String uidReceived;
  String status;

  PurchaseOrderDetails({this.poDate, this.poType, this.poValue, this.status, this.uid, this.transactTimestamp, this.uidReceived});

  PurchaseOrderDetails.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        key = dataSnapshot.key,
        poDate = dataSnapshot.value["poDate"].toString(),
        poValue = double.parse(dataSnapshot.value["poValue"].toString()),
        poType = dataSnapshot.value["poType"],
        uidReceived = dataSnapshot.value["uidReceived"],
        transactTimestamp = int.parse(dataSnapshot.value["transactTimestamp"].toString()),
        status = dataSnapshot.value["status"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "poDate": poDate,
      "poValue": poValue,
      "poType": poType,
      "uidReceived": uidReceived,
      "transactTimestamp": transactTimestamp,
      "status": status,
    };
  }
}