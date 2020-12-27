import 'dart:io';

import 'package:b_provider/cofig/palette.dart';
import 'package:b_provider/screens/main_screens/nav_screens.dart';
import 'package:b_provider/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:b_provider/screens/main_screens/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:b_provider/models/categoryModel.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final _formKey =GlobalKey<FormState>();

      String error = '';
      String listId;
          String categoryId;
      String name;
          String imageUrl;
      String description;
          double latitude;
      double longitude;
          String providerId;
      String providerName;
          int providerTel;
      double unitPrice;
          int units;
      DateTime date;
      bool loading = false;
      LatLng location;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      appBar:AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              color: Palette.facebookBlue,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            }),
        brightness: Brightness.light,
        title: Text(
          'Listing',
          style: const TextStyle(
            color:Colors.grey,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () async{
//                await DatabaseService().signInAnon();
              },
              icon: Icon(Icons.person , color: Colors.white,),
              label: Text('Register',
                style: TextStyle(color: Colors.white),
              )
          )
        ],
      ) ,
      body: Container(
        height: MediaQuery.of(context).size.height -90,
        decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.only(topLeft: Radius.circular(130.0), )
        ),
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(left: 25.0, right: 20.0),
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (val) => val.isEmpty  ? 'enter Name' :null,
                      onChanged: (val){
                        setState(() {
                          name= val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                      validator: (val) => val.isEmpty  ? 'enter Description' :null,
                      onChanged: (val){
                        setState(() {
                          description= val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Units',
                      ),
                      validator: (val) => val.isEmpty  ? 'enter Caption' :null,
                      onChanged: (val){
                        setState(() {
                          units = int.parse(val);

                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Unit Price',
                      ),
                      validator: (val) => val.isEmpty  ? 'enter Caption' :null,
                      onChanged: (val){
                        setState(() {

                          unitPrice = double.parse(val);

                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Telephone',
                      ),
                      validator: (val) => val.isEmpty  ? 'enter telephone number' :null,
                      onChanged: (val){
                        setState(() {
                          providerTel= int.parse(val);

                        });
                      },
                    ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('categories').snapshots(),
                    builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
//                      child: CupertinoActivityIndicator(),
                    );

                  return Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12.0, 10.0, 10.0, 10.0),
                              child: Text(
                                "Category",
                              ),
                            )),
                        new Expanded(
                          flex: 4,
                          child: DropdownButton(
                            value: categoryId,
                            isDense: true,
                            onChanged: (valueSelectedByUser) {
                              this.categoryId = valueSelectedByUser;
                              print(categoryId);
//                              _onShopDropItemSelected(valueSelectedByUser);
                            },
                            hint: Text('Choose shop'),
                            items: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return DropdownMenuItem<String>(
                                value: document.data()['Id'],

                                child: Text(document.data()['Name'] ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.blue[700],
                        child: Text(
                          'Add Image',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () async{

                          uploadImage();
                        }
                    ),
//                    Container(
//                        child: locationButton(),
//
//                    ),
                    RaisedButton(
                        color: Colors.blue[700],
                        child: Text(
                          'Add Location',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () async {
                          final LatLng location = await Navigator.push(

                            context,
                            // Create the SelectionScreen in the next step.
                            MaterialPageRoute(builder: (context) => MyHomePage()),


                          );
                          longitude= location.longitude;
                          latitude= location.latitude;
                          Scaffold.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text("$latitude")));

                        }
                    ),

                    SizedBox(height: 20.0),
                    (imageUrl != null)
                        ? Image.network(imageUrl)
                        : Placeholder(fallbackHeight: 150.0,fallbackWidth: double.infinity, color: Colors.transparent,),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.blue[700],
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () async{
                          if(name != null || imageUrl != null || unitPrice != null ){
                           // DatabaseService().setPost(caption, imageUrl, "dra,aclub",Uuid().v1() , "https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png", "Dancing Club", DateTime.now());
                             DatabaseService().setListning(
                                 Uuid().v1(),
                               "wQUQRzDTubHd8KwI2wLg",
                               name,
                               imageUrl,
                               description,
                               latitude,longitude,"providerId","providerName",providerTel,unitPrice,units,DateTime.now()
                             );

                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder:(context) => NavScreen()
                              ),);
                          }
                          else{
                            error = "Add details";
                          }


                        }
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red,fontSize: 14.0),
                    )
                  ],
                )
            )
          ],
        ),
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // child:

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
            .child("postImage/image1" + DateTime.now().toString())
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

//class locationButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return  RaisedButton(
//        color: Colors.blue[700],
//        child: Text(
//          'Add Location',
//          style: TextStyle(
//              color: Colors.white
//          ),
//        ),
//        onPressed: () {
//          _navigateAndDisplaySelection(context);
//        }
//    );
//  }
//  _navigateAndDisplaySelection(BuildContext context) async {
//    // Navigator.push returns a Future that completes after calling
//    // Navigator.pop on the Selection Screen.
//
//    final LatLng location = await Navigator.push(
//
//      context,
//      // Create the SelectionScreen in the next step.
//      MaterialPageRoute(builder: (context) => MyHomePage()),
//
//
//    );
//    Scaffold.of(context)
//      ..removeCurrentSnackBar()
//      ..showSnackBar(SnackBar(content: Text("$location")));
//  }
//
//
//}
//
