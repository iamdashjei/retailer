class DitoUser{
  String accessToken;
  String tokenType;
  DitoUserDetails details;

  DitoUser({
    this.accessToken,
    this.tokenType,
    this.details,
  });


  factory DitoUser.fromJson(Map<String, dynamic> json) {
    return DitoUser(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        details: DitoUserDetails.fromJson(json['user'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['user'] = details.toJson();

    return data;
  }



}


class DitoUserDetails {
  int id;
  String uid;
  String profileImg;
  String fName;
  String mName;
  String lName;
  String gender;
  String birthday;
  String contactNo;
  String emailAddress;
  String address;
  String latitude;
  String longitude;
  String businessName;
  int idType;
  String idNo;
  String idImg;
  double loadAmount;
  String activationCode;
  int roleId;
  String lastActive;
  int isOnline;
  int isActivateCodeActive;
  int isActive;
  String createdAt;
  String updatedAt;
  Map assignedTeamsSubd;
  Map assignedTeamsDsp;



  DitoUserDetails({
    this.id,
    this.uid,
    this.profileImg,
    this.fName,
    this.mName,
    this.lName,
    this.gender,
    this.birthday,
    this.contactNo,
    this.emailAddress,
    this.address,
    this.latitude,
    this.longitude,
    this.businessName,
    this.idType,
    this.idNo,
    this.idImg,
    this.loadAmount,
    this.activationCode,
    this.roleId,
    this.lastActive,
    this.isActive,
    this.isActivateCodeActive,
    this.isOnline,
    this.createdAt,
    this.updatedAt,
    this.assignedTeamsSubd,
    this.assignedTeamsDsp
  });

  DitoUserDetails.fromJson(Map json) {
        id=  json['id'] != null ? int.parse(json['id'].toString()) : null;
        uid= json['uid'];
        profileImg= json['profile_img'];
        fName= json['fname'];
        mName= json['mname'];
        lName= json['lname'];
        gender= json['gender'];
        birthday= json['birthday'];
        contactNo= json['contact_no'];
        emailAddress= json['email_address'];
        address= json['address'];
        latitude= json['latitude'];
        longitude= json['longitude'];
        businessName = json['business_name'];
        idType= json['identification_type_id'] != null ? int.parse(json['identification_type_id'].toString()) : null;
        idNo= json['identification_no'];
        idImg= json['identification_img'];
        loadAmount= json['load_amount'] != null ? double.parse(json['load_amount'].toString()) : null;
        activationCode= json['activation_code'];
        roleId= json['role_id'] != null ? int.parse(json['role_id'].toString()) : null;
        lastActive= json['last_active'] != null ? json['last_active'] : null;
        isActivateCodeActive= json['is_activation_code_active'] != null ? int.parse(json['is_activation_code_active'].toString()) : null;
        isActive= json['is_active'] != null ? int.parse(json['is_active'].toString()) : null;
        isOnline= json['is_online'] != null ? int.parse(json['is_online'].toString()) : null;
        createdAt= json['created_at'] != null ? json['created_at'] : "";
        updatedAt= json['updated_at'] != null ? json['updated_at'] : "";
        assignedTeamsSubd = json['assignedTeams'] == null ? null : Map.fromIterable(json['assignedTeams']["subd"]);
        assignedTeamsDsp = json['assignedTeams'] == null ? null : Map.fromIterable(json['assignedTeams']["dsp"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['uid'] = uid;
    data['profileImg'] = profileImg;
    data['fName'] = fName;
    data['mName'] = mName;
    data['lName'] = lName;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['contactNo'] = contactNo;
    data['emailAddress'] = emailAddress;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['businessName'] = businessName;
    data['idType'] = idType;
    data['idNo'] = idNo;
    data['idImg'] = idImg;
    data['loadAmount'] = loadAmount;
    data['activationCode'] = activationCode;
    data['roleId'] = roleId;
    data['lastActive'] = lastActive;
    data['isOnline'] = isOnline;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['assignedTeamsSubd'] = assignedTeamsSubd;
    data['assignedTeamsDsp'] = assignedTeamsDsp;

    return data;
  }


}