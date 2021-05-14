import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wstar_retailer/models/dito_user.dart';
import 'package:wstar_retailer/util/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wstar_retailer/models/retailer.dart';

class ProfilePage extends StatefulWidget {
  final DitoUser ditoUser;

  const ProfilePage({Key key, this.ditoUser}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  File _image;
  Future<File> imageFile;

  SharedPreferences preferences;
  DatabaseReference profileReference;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: HexColor("#0B1043"),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child:  CircleAvatar(
                          radius: 51.0,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50.0,
                            //child: updatedImage != null ? Image.network("$updatedImage", fit: BoxFit.scaleDown,) :SvgPicture.asset('assets/image/profiles.svg'),
                            //backgroundImage: widget.myInfo.avatar != null ? NetworkImage(widget.myInfo.avatar) : NetworkImage("'https://raw.githubusercontent.com/socialityio/laravel-default-profile-image/master/docs/images/profile.png'"),
                            backgroundImage: NetworkImage("https://raw.githubusercontent.com/socialityio/laravel-default-profile-image/master/docs/images/profile.png"),
                          ),
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Business Name',
                          labelText: 'Business Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.businessName,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your First Name',
                          labelText: 'First Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.fName,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Middle Name',
                          labelText: 'Middle Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.mName,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Last Name',
                          labelText: 'Last Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.lName,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Contact No.',
                          labelText: 'Contact No.',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.contactNo,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.emailAddress,
                      ),

                      TextFormField(
                        enabled: false,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Address',
                          labelText: 'Address',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.address,
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your ID Type',
                          labelText: 'ID Type',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.idType.toString(),
                      ),

                      TextFormField(

                        enabled: false,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your ID No.',
                          labelText: 'ID No.',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: widget.ditoUser.details.idNo,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Divider(),
                          Image.network("https://raw.githubusercontent.com/socialityio/laravel-default-profile-image/master/docs/images/profile.png", width: 400, height: 300),
                          //widget.myInfo.idImageUrl != null ? Image.network(widget.myInfo.idImageUrl, width: 400, height: 300) : Container(),
                          // RaisedButton(
                          //   child: Text("Change Image"),
                          //   onPressed: () {
                          //     pickImageFromGallery(ImageSource.camera);
                          //   },
                          // ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
    );
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);

    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          _image = snapshot.data;
          return Image.file(
            snapshot.data,
            width: 450,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }






}
