

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class categoryContainer extends StatelessWidget {

  final String caption;
  final String imageUrl;
  final String clubImage;
  final String clubName;
  final DateTime date;

  const categoryContainer({Key key, this.caption, this.imageUrl, this.clubImage, this.clubName, this.date}) : super(key: key);
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
                  Text(DateFormat.yMMMd().format(date)),
                  const SizedBox(height: 4.0,),
                  Text(caption),
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
              child: _postStats(clubName: clubName,),
            )
          ],
        )


    );
  }
}



class _postStats extends StatelessWidget {
  final String clubName;

  const _postStats({Key key, this.clubName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(

              width: 100,
              height: 25,
              padding: const EdgeInsets.all(4.0),
              child: RaisedButton(
                color: Colors.blue[400],
                onPressed: () {
//                  Navigator.push(context,
//                    MaterialPageRoute(
//                      builder:(context) => ClubPage(clubName: clubName,)
//                  ),);
                },
                child: const Text('View Club',
                    style: TextStyle(fontSize: 11 , color: Colors.white)),
              ),
            ),
            const SizedBox(width: 4.0,),
            Container(

              width: 140,
              height: 25,
              padding: const EdgeInsets.all(4.0),
              child: RaisedButton(
                color: Colors.blue[400],
                onPressed: () {
                  print("Register");
                },
                child: const Text('Register Event',
                    style: TextStyle(fontSize: 11 , color: Colors.white)),
              ),
            ),

          ],
        ),
        const Divider(),

      ],
    );

  }
}