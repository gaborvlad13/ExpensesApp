import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
 // String name;
 // String description;
  //double price;

  Product({
    this.id,
    //this.name,
    //this.description,
    //this.price,
  });

  Product.fromDocumentSnapshot({DocumentSnapshot doc}) {
    id = doc.id;
  }
}
