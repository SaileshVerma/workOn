import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:work_on/providers/service_model.dart';
import 'package:work_on/providers/services.dart';

class AddProfile extends StatefulWidget {
  static const routname = '/addprofilescreen';
  @override
  _AddProfileState createState() => _AddProfileState();
}

File image;

class _AddProfileState extends State<AddProfile> {
  var _dummyservice = Service(
      id: null,
      name: "",
      phn: "",
      fees: '',
      skill: "",
      imgurl: "",
      lat: 74.21793260000001,
      long: 27.023803599999997);

  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<Services>(context);
    Future getImage() async {
      var img = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        image = img;
      });

      final ref = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().toString() + ".jpg");

      // await ref.putFile(image).whenComplete(
      //       () async => _dummyservice.imgurl = await ref.getDownloadURL(),
      //     );

      await ref.putFile(image).onComplete;
      _dummyservice.imgurl = await ref.getDownloadURL();

      // setState(() {
      //   _dummyservice.imgurl = url;
      // });

      print("firebase image profile :::::::::" + _dummyservice.imgurl);
    }

    Future<void> cameradialogBox() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Choose an image"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Gallery',
                        style: TextStyle(color: Colors.orange),
                      ),
                      onTap: () {
                        getImage();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "ADD YOUR DETAILS",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(224, 153, 47, 1),
                      radius: 38,
                      child: CircleAvatar(
                        backgroundImage:
                            (image == null) ? null : FileImage(image),
                        backgroundColor: Colors.black54,
                        radius: 34,
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 35,
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.camera_alt,
                          size: 20,
                        ),
                        onPressed: () {
                          cameradialogBox();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter Name :",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(224, 153, 47, 1),
                      )),
                  onChanged: (val) {
                    _dummyservice.name = val;
                  },
                ),
                SizedBox(
                  height: 27,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter Your Skill :",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(224, 153, 47, 1),
                      )),
                  onChanged: (val) {
                    _dummyservice.skill = val;
                    print("its my url ::::" + _dummyservice.imgurl);
                  },
                ),
                SizedBox(
                  height: 27,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter Fees :",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(224, 153, 47, 1),
                      )),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    _dummyservice.fees = val;
                  },
                ),
                SizedBox(
                  height: 27,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter Phone Number :",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(224, 153, 47, 1),
                      )),
                  onChanged: (val) {
                    _dummyservice.phn = val;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 27,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)),
                  child: FlatButton(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 22,
                        // fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(224, 153, 47, 1),
                      ),
                    ),
                    onPressed: () {
                      sprovider.addRequestService(_dummyservice);
                    },
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
