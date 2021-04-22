import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:wstar_retailer/util/hex_color.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  File _image;
  Future<File> imageFile;

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
                            backgroundImage: AssetImage("assets/images/splash_image.png"),
                          ),
                        ),
                      ),
                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Business Name',
                          labelText: 'Business Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "Aling Puring Sari Sari Store",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your First Name',
                          labelText: 'First Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "James",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Middle Name',
                          labelText: 'Business Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "Basco",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Last Name',
                          labelText: 'Last Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "Santos",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Contact No.',
                          labelText: 'Contact No.',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "+63 916 5615 552",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),

                      TextFormField(
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Address',
                          labelText: 'Business Name',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "Blk 38 Lot 14 Anunas St. Brgy Balibago, Angeles City, Pampanga",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your ID Type',
                          labelText: 'ID Type',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "Driver's License",
                      ),

                      TextFormField(

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter Your ID No.',
                          labelText: 'ID No.',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        initialValue: "C10-4212432-23421",
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Divider(),
                          showImage(),
                          RaisedButton(
                            child: Text("Change Image"),
                            onPressed: () {
                              pickImageFromGallery(ImageSource.camera);
                            },
                          ),
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
