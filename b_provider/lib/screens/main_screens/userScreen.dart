

import 'package:b_provider/models/newUser.dart';
import 'package:b_provider/screens/main_screens/profilePage.dart';
import 'package:b_provider/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserPage extends StatelessWidget {
  User user2 = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<regUser>>(
      stream: DatabaseService().getUser(user2.uid),
      builder: (context,snapshot){
        return PageView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
              return ProfilePage(
                imageurl: snapshot.data[index].imageurl,
                shopName: snapshot.data[index].shopName,
                phNumber: snapshot.data[index].phoneNumner,
                coins: snapshot.data[index].coins,
                lists: snapshot.data[index].lists,
              );
            }
        );
      },
    );
  }
}
