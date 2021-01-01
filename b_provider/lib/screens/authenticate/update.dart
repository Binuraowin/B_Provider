import 'dart:io';

import 'package:b_provider/services/auth.dart';
import 'package:b_provider/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'inputdeco.dart';

class UpdatePage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final int phone;
  final String uid;
  final int coins;

  const UpdatePage({Key key, this.name, this.imageUrl, this.phone, this.uid, this.coins}) : super(key: key);
  @override
  _UpdatePageState createState() => _UpdatePageState(name,imageUrl,phone,uid,coins);
}

class _UpdatePageState extends State<UpdatePage> {
  final AuthService _auth = AuthService();
   String name;
   String imageUrl;
   int phone;
   String uid;
   int coins;

//  String name;
//  int phone;
  bool loading = false;
  String error = '';
//  String imageUrl;
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  _UpdatePageState(this.name, this.imageUrl, this.phone, this.uid, this.coins);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('update Profile'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child:  (imageUrl != null)
                        ? Image.network(imageUrl)
                        :Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),


                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      initialValue: name,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person,"Full Name"),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      onSaved: (String value){
                        name = value;
                      },
                      onChanged: (val){
                        setState(() {
                          name= val;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      initialValue: phone.toString(),
                      keyboardType: TextInputType.number,
                      decoration:buildInputDecoration(Icons.phone,"Phone No"),
                      validator: (String value){
                        if(value.isEmpty || value.length<10 || value.length>10 )
                        {
                          return 'Please enter phone no ';
                        }
                        return null;
                      },
//                      onSaved: (String value){
//                        phone = value;
//                      },
                      onChanged: (val){
                        setState(() {
                          phone= int.parse(val);
                        });
                      },
                    ),
                  ),



                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () async {

                        await uploadImage();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Add Image"),

                    ),

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () async {

                        if(_formkey.currentState.validate())
                        {
                          DatabaseService().updateData(name, uid, name, phone, coins, imageUrl);
                          print("successful");
                          Navigator.pop(context);

//                          if(result == null){
//                            setState(() {
//                              error='enter valid email';
////                            loading= true;
//                            });
//                          }
                          return;
                        }else{
                          print("UnSuccessfull");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Update"),

                    ),

                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red,fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child("user/image" + DateTime.now().toString())
            .putFile(file) ;
        // .onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }

    print(imageUrl);}

}

