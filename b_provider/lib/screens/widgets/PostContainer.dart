import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:b_provider/screens/widgets/profileAvatar.dart';

//import 'package:b_finder/Screens/main_screens/description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:b_finder/screens/widgets/profileAvatar.dart';
import 'package:intl/intl.dart';


class PostContainer extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final double unitPrice;
  final double latitude;
  final double longitude;
  final String providerName;
  final int providerTel;
  final int units;
  final String description;
  final DateTime date;
  final String providerId;
  final int likes;
  final int views;

  //
//  User user2 = FirebaseAuth.instance.currentUser;
  DocumentSnapshot snapshot;
  PostContainer({Key key, this.id, this.imageUrl, this.name, this.unitPrice, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description, this.date, this.providerId, this.likes, this.views}) : super(key: key);
  void getData()async{ //use a Async-await function to get the data

    final data =  await FirebaseFirestore.instance.collection("users").doc(providerId).get(); //get the data
    snapshot = data;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _postHeader(
                    providerimage: snapshot.data()['imageurl'],
                    providerName: providerName,
                    date: date,
                  ),
                  const SizedBox(height: 4.0,),
                  Text(unitPrice.toString()),
                  imageUrl != null ? const SizedBox.shrink() : const SizedBox(height: 6.0,)

                ],
              ),
            ),
            imageUrl != null ?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(imageUrl),
              // CachedNetworkImage(imageUrl: post.imageUrl),
            )

                : const SizedBox.shrink(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _postStats(
                likes: likes,
                views: views,
                imageUrl: imageUrl,
                longitude: longitude,
                latitude: latitude,
                providerName: providerName,
                providerTel: providerTel,
                units: units,
                description: description,
                unitPrice: unitPrice,
                productName: name,
                date: date,

              ),
            )
          ],
        )


    );
  }
}

class _postHeader  extends StatelessWidget {
  final String providerimage;
  final String providerName;
  final DateTime date;

  const _postHeader({Key key, this.providerimage, this.providerName, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imageUrl:providerimage),
        const SizedBox(width:8.0),
        Expanded(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(providerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(DateFormat.yMMMd().format(date),
                      style:  TextStyle(color: Colors.grey[600],
                          fontSize: 12.0
                      ),
                    ),
                    Icon(Icons.public,
                        color: Colors.grey[600],
                        size: 12.0
                    )
                  ],
                )
              ],
            )
        ),

      ],
    );
  }
}

class _postStats extends StatelessWidget {
  final int likes;
  final int views;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String providerName;
  final int providerTel;
  final int units;
  final String description;
  final double unitPrice;
  final String productName;
  final DateTime date;

  const _postStats({Key key, this.likes, this.views, this.imageUrl, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description, this.unitPrice, this.productName, this.date}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),const SizedBox(width: 4.0,),
            Expanded(child: Text(
              likes.toString(), style: TextStyle(
              color: Colors.grey[600],
            ),
            ),),

            Text(
              '${views} Views', style: TextStyle(
              color: Colors.grey[600],
            ),
            ),
            const SizedBox(width:8.0),
//            Text(
//              '${post.shares} Shares', style: TextStyle(
//              color: Colors.grey[600],
//            ),
//            )
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label : 'Like',
              onTap: () => print('Like'),
            ),
//            _PostButton(
//              icon: Icon(
//                MdiIcons.commentOutline,
//                color: Colors.grey[600],
//                size: 20.0,
//              ),
//              label : 'Comment',
//              onTap: () => print('Comment'),
//            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label : 'View',
              onTap: () {
//                Navigator.push(
//
//                  context,
//                  // Create the SelectionScreen in the next step.
//                  MaterialPageRoute(builder: (context) => DescriptionPage(
//                    imageUrl: imageUrl,
//                    latitude: latitude,
//                    longitude: longitude,
//                    productName: productName,
//                    providerTel: providerTel,
//                    units: units,
//                    description: description,
//                    unitPrice: unitPrice,
//                    providerName: providerName,
//                    date: date,
//                  )),
//
//
//                );
              },
            )
          ],
        )
      ],
    );

  }
}

class _PostButton  extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({Key key, this.icon, this.label, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                  const SizedBox(width: 4.0,),
                  Text(label)
                ],
              ),
            )

        ),
      ),
    );
  }
}