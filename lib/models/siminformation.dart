class SIMInformation{

  DateTime date;
  String barcodeNumber;
  double amount;

  SIMInformation({this.date, this.barcodeNumber, this.amount});

}

class LoadInformation {
  DateTime date;
  String mobileNumber;
  double amount;
  String offerDescription;

  LoadInformation({this.date, this.mobileNumber, this.amount, this.offerDescription});
}

class PurchaseOrderDetails{

  DateTime poDate;
  String poType;
  double poValue;
  String status;

  PurchaseOrderDetails({this.poDate, this.poType, this.poValue, this.status});
}