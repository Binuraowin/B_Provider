import 'package:b_provider/screens/authenticate/update.dart';
import 'package:b_provider/services/auth.dart';
import 'package:b_provider/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:b_provider/models/newUser.dart';

class ProfilePage extends StatefulWidget {
  final String imageurl;
  final String shopName;
  final int phNumber;
  final int coins;


   ProfilePage({Key key, this.imageurl, this.shopName, this.phNumber,this.coins}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(imageurl,shopName,phNumber,coins);
}

class _ProfilePageState extends State<ProfilePage> {
  final String imageurl;
  final String shopName;
  final int phNumber;
  final int coins;
  final AuthService _auth = AuthService();

  DocumentSnapshot snapshot;
  User user2 = FirebaseAuth.instance.currentUser;

  _ProfilePageState(this.imageurl, this.shopName, this.phNumber, this.coins);

  void getData()async{ //use a Async-await function to get the data
    final data =  await FirebaseFirestore.instance.collection("users").doc(user2.uid).get(); //get the data
    snapshot = data;
  }

  @override
  Widget build(BuildContext context) {
      DatabaseService().getUser(user2.uid);
    getData();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int canbelist = 5-coins;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.blue[100],
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.white,
                      ),
                      FlatButton.icon(
                          onPressed: () async{
                            await _auth.signOut();
                          },
                          icon: Icon(Icons.person , color: Colors.white,),
                          label: Text('logout',
                            style: TextStyle(color: Colors.white),
                          )
                      )
                    ],
                  ),

                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),

                  Container(
                    height: height * 0.5,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      shopName,
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 37,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      phNumber.toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Nunito',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Lists',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              canbelist.toString(),
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Coins',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              coins.toString(),
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
//                                    Container(
//                                      child: Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-81666.appspot.com/o/postImage%2Fimage12020-12-24%2014%3A45%3A44.792840?alt=media&token=6e0fc6e5-7808-4b8c-bbf2-993edf1204dd'),
//                                    )
                                  ],

                                ),
                              ),
                            ),
//                            Positioned(
//                              top: 110,
//                              right: 20,
//                              child: Icon(
//                                AntDesign.setting,
//                                color: Colors.grey[700],
//                                size: 30,
//                              ),
//                            ),
//                            Positioned(
//                              top: 0,
//                              left: 0,
//                              right: 0,
//                              child: Center(
//                                child: Container(
//                                  child:Image.network('https://firebasestorage.googleapis.com/v0/b/bookstore-81666.appspot.com/o/postImage%2Fimage12020-12-24%2014%3A45%3A44.792840?alt=media&token=6e0fc6e5-7808-4b8c-bbf2-993edf1204dd')
//                                ),
//                              ),
//                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child:Image.network(imageurl)
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Setings',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.10,
                            width: width,
                            child: RaisedButton(
                                splashColor: Colors.blue,
                                color: Colors.blue[700],
                                child: Text(
                                  'Get more coins',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                onPressed: () async{


                                }
                            ),
                          ),

//                          Container(
//                            height: height * 0.15,
//                            decoration: BoxDecoration(
//                              color: Colors.grey,
//                              borderRadius: BorderRadius.circular(30),
//                            ),
//                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.10,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: RaisedButton(

                                color: Colors.blue[700],
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                onPressed: () async{
                                  Navigator.push(

                                    context,
                                    // Create the SelectionScreen in the next step.
                                    MaterialPageRoute(builder: (context) => UpdatePage(
                                      name: snapshot.data()['shopName'],
                                      imageUrl: snapshot.data()['imageurl'],
                                      phone:  snapshot.data()['phoneNumner'],
                                      uid: user2.uid,
                                      coins: snapshot.data()['coins'],
                                    )),


                                  );

                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}