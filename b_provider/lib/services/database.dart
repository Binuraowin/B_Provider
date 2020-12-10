import 'package:b_provider/models/subCategoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:b_provider/models/authUser.dart';
import 'package:b_provider/models/brew.dart';
import 'package:b_provider/models/categoryModel.dart';
import 'package:b_provider/models/product.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
//   DatabaseService(this.uid);
  final CollectionReference brewreference = Firestore.instance.collection('brews');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
   final CollectionReference categoryreference  = Firestore.instance.collection('categories');
  //  final CollectionReference productreference  = Firestore.instance.collection('categories').doc(categoryName);
 User user = FirebaseAuth.instance.currentUser;

    Future<void> updateData(
  final String name,
  final String sugars,
  final int strength,
 final  String uid,

    ) async {
    return await brewreference.doc(uid).set({
     'name':name,
     'strength':strength,
     'sugars':sugars,

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

Stream<List<Product>> get products{
 String categoryName;
 String productName;
  return categoryreference.doc('foods').collection('Rice').snapshots().map(_productsfoemSnapshots);
}




  Stream<List<CategoryModel>> getCategories() {
    return _db.collection('categories').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList());
  }
  Stream<List<SubCategoryModel>> getSubCategories(docId) {
    return _db.collection('categories').doc(docId).collection('subCategories').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => SubCategoryModel.fromJson(doc.data())).toList());
  }
//Stream<List<CategoryModel>> get category{
//  return categoryreference.snapshots().map(_categoryfoemSnapshots);
//}


  }