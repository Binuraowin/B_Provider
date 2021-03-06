import 'package:b_provider/models/newUser.dart';
import 'package:b_provider/models/subCategoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:b_provider/models/authUser.dart';
import 'package:b_provider/models/brew.dart';
import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/models/product.dart';

import 'auth.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
//   DatabaseService(this.uid);
  final CollectionReference brewreference = Firestore.instance.collection('users');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
   final CollectionReference categoryreference  = Firestore.instance.collection('categories');
  //  final CollectionReference productreference  = Firestore.instance.collection('categories').doc(categoryName);
 User user = FirebaseAuth.instance.currentUser;

    Future<void> updateData(
  final String name,
  final String uid,
  final String shopName,
  final int phoneNumner,
  final int coins,
  final String imageurl,
  final int lists,
    ) async {
    return await brewreference.doc(uid).set({
     'name':name,
     'uid':uid,
     'shopName':shopName,
      'phoneNumner':phoneNumner,
      'coins':coins,
      'imageurl':imageurl,
      'lists':lists,

    });

  }
List<Brew> _brewFromSnapshots(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc){
    return Brew(
      name:doc.data()['name'] ?? '',
      strength:doc.data()['strength'] ?? '',
      sugars:doc.data()['sugars'] ?? '', reference: null,


    );

  }).toList();


}

Stream<List<Brew>> get transports{
  return brewreference.snapshots().map(_brewFromSnapshots);

}

  Future<void> setListning(
      String listId,
      String categoryId,
      String name,
      String imageUrl,
      String description,
      double latitude,
      double longitude,
      String providerId,
      String providerName,
      int providerTel,
      double unitPrice,
      int units,
      DateTime date,
      int likes,
      int views,
      String providerImage,
      String district,
      String address,
      ){

    return _db.collection('categories').doc('$categoryId').collection("subCategories").doc(listId).set({
      "listId":listId,
      "categoryId":categoryId,
      "Name":name,
      "imageUrl":imageUrl,
      "description":description,
      "latitude":latitude,
      "longitude":longitude,
      "providerId":providerId,
      "providerName":providerName,
      "providerTel":providerTel,
      "unitPrice":unitPrice,
      "units":units,
      "date":date,
      "likes":likes,
      "views":views,
      "providerImage":providerImage,
      "district":district,
      "address":address,
    });
  }

  Future<void> updatelistining(
      String listId,
      String categoryId,
      String name,
      String imageUrl,
      String description,
      double latitude,
      double longitude,
      String providerId,
      String providerName,
      int providerTel,
      double unitPrice,
      int units,
      DateTime date,
      int likes,
      int views,
      String providerImage,
      String district,
      String address,
      ){

    return _db.collection('categories').doc('$categoryId').collection("subCategories").doc(listId).set({
      "listId":listId,
      "categoryId":categoryId,
      "Name":name,
      "imageUrl":imageUrl,
      "description":description,
      "latitude":latitude,
      "longitude":longitude,
      "providerId":providerId,
      "providerName":providerName,
      "providerTel":providerTel,
      "unitPrice":unitPrice,
      "units":units,
      "date":date,
      "likes":likes,
      "views":views,
      "providerImage":providerImage,
      "district":district,
      "address":address,
    });
  }

  void decremenetCoin(){
    FirebaseFirestore.instance.collection("users").doc(user.uid).update({
      "coins":FieldValue.increment(-1),
    });
  }
  void incrementlist(){
    FirebaseFirestore.instance.collection("users").doc(user.uid).update({
      "lists":FieldValue.increment(1),
    });
  }
List<Product> _productsfoemSnapshots(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc){
    return Product(
      address:doc.data()['address'] ?? '',
      description:doc.data()['description'] ?? '',
      price:doc.data()['price'] ?? '',
      productName:doc.data()['productName'] ?? '',
      shopName:doc.data()['shopName'] ?? '',


    );

  }).toList();


}

//Stream<List<Product>> get products{
// String categoryName;
// String productName;
//  return categoryreference.doc('foods').collection('Rice').snapshots().map(_productsfoemSnapshots);
//}


  Stream<List<CategoryModel>> getCategories() {
    return _db.collection('categories').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList());
  }
  Stream<List<SubCategoryModel>> getSubCategories(docId) {
    return _db.collection('categories').doc('$docId').collection('subCategories').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => SubCategoryModel.fromJson(doc.data())).toList());
  }
  Stream<List<SubCategoryModel>> getSubCategoriesById(providerId,docId) {
    return _db.collection('categories').doc(docId).collection('subCategories').where('providerId', isEqualTo: '$providerId').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => SubCategoryModel.fromJson(doc.data())).toList());
  }
  Stream<List<SubCategoryModel>> getSubCategorieswithoutid() {
    return _db.collection('categories').doc('phAKAFpbNEXbW2bqmUfT').collection('subCategories').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => SubCategoryModel.fromJson(doc.data())).toList());
  }
  Future<void> deleteList(String postId,String docId){
    return _db.collection('categories').doc(docId).collection('subCategories').doc(postId).delete();
  }

  Stream<List<regUser>> getUser(String uid) {
    return _db.collection('users').where('uid', isEqualTo: '$uid').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => regUser.fromJson(doc.data())).toList());
  }

  final AuthService _auth = AuthService();
  DocumentSnapshot snapshot; //
  User user2 = FirebaseAuth.instance.currentUser;
  void getData()async{ //use a Async-await function to get the data
    final data =  await FirebaseFirestore.instance.collection("users").doc(user2.uid).get(); //get the data
    snapshot = data;
  }
//Stream<List<CategoryModel>> get category{
//  return categoryreference.snapshots().map(_categoryfoemSnapshots);
//}


  }