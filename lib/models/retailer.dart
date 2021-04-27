import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

class Retailer{
  String key;
  String uid;
  String fullName;
  String businessName;
  String businessType;
  String avatar;
  String firstName;
  String middleName;
  String lastName;
  String contactNo;
  String email;
  double lat;
  double lng;
  String address;
  String idType;
  String idNo;
  String idImageUrl;
  String pin;
  int lastActiveAt;
  String createdAt;
  String status;
  String activatedStatus;
  String type;
  String createdBy;
  String creationRetailerStatus;
  Map<dynamic, dynamic> retailerData = new HashMap<dynamic, dynamic>();
  Map<dynamic, dynamic> extraData = new HashMap<dynamic, dynamic>();


  Retailer({
    this.uid,
    this.fullName,
    this.avatar,
    this.type,
    this.createdBy,
    this.creationRetailerStatus,
    this.activatedStatus,
    this.status,
    this.createdAt,
    this.lastActiveAt,
    this.businessName,
    this.businessType,
    this.firstName,
    this.middleName,
    this.lastName,
    this.contactNo,
    this.email,
    this.lat,
    this.lng,
    this.address,
    this.idType,
    this.idNo,
    this.idImageUrl,
    this.pin,
    this.retailerData,
    this.extraData
  });

  Retailer.fromSnapshot(DataSnapshot dataSnapshot)
      : uid = dataSnapshot.value["uid"],
        fullName = dataSnapshot.value["fullName"],
        avatar = dataSnapshot.value["avatar"],
        type = dataSnapshot.value["type"],
        createdBy = dataSnapshot.value["createdBy"],
        creationRetailerStatus = dataSnapshot.value["creationRetailerStatus"],
        activatedStatus = dataSnapshot.value["activatedStatus"],
        status = dataSnapshot.value["status"],
        createdAt = dataSnapshot.value["createdAt"],
        lastActiveAt = int.parse(dataSnapshot.value["lastActiveAt"].toString()),
        businessName = dataSnapshot.value["businessName"],
        businessType = dataSnapshot.value["businessType"],
        firstName = dataSnapshot.value["firstName"],
        middleName = dataSnapshot.value["middleName"],
        lastName = dataSnapshot.value["lastName"],
        contactNo = dataSnapshot.value["contactNo"],
        email = dataSnapshot.value["email"],
        lat = double.parse(dataSnapshot.value["lat"].toString()),
        lng = double.parse(dataSnapshot.value["lng"].toString()),
        address = dataSnapshot.value["address"],
        idType = dataSnapshot.value["idType"],
        idNo = dataSnapshot.value["idNo"],
        idImageUrl = dataSnapshot.value["idImageUrl"],
        pin = dataSnapshot.value["pin"],
        retailerData = dataSnapshot.value["retailerData"],
        extraData = dataSnapshot.value["extraData"];


  Map<String, dynamic> toJson(){
    return {
      "uid": uid,
      "fullName": fullName,
      "avatar": avatar,
      "type": type,
      "createdBy": createdBy,
      "creationRetailerStatus": creationRetailerStatus,
      "activatedStatus": activatedStatus,
      "status": status,
      "createdAt": createdAt,
      "lastActiveAt": lastActiveAt,
      "businessName": businessName,
      "businessType": businessType,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "contactNo": contactNo,
      "email": email,
      "lat": lat,
      "lng": lng,
      "address": address,
      "idType": idType,
      "idNo": idNo,
      "idImageUrl": idImageUrl,
      "pin": pin,
      "retailerData": retailerData,
      "extraData": extraData,
    };
  }

  @override
  int get hashCode =>
      uid.hashCode ^
      fullName.hashCode ^
      avatar.hashCode ^
      type.hashCode ^
      createdBy.hashCode ^
      creationRetailerStatus.hashCode ^
      activatedStatus.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      lastActiveAt.hashCode ^
      businessName.hashCode ^
      businessType.hashCode ^
      firstName.hashCode ^
      middleName.hashCode ^
      lastName.hashCode ^
      contactNo.hashCode ^
      email.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      address.hashCode ^
      idType.hashCode ^
      idNo.hashCode ^
      idImageUrl.hashCode ^
      pin.hashCode ^
      retailerData.hashCode ^
      extraData.hashCode;






}