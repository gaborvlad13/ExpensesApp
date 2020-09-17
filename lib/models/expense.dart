import 'package:ExpensesApp/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'
;
class Expense {
  String id;
  String date;
  String title;
  String description;
  double price;
  String categorie;
  Expense({
    this.id,
    this.title,
    this.description,
    this.price,
    this.date,
    this.categorie,
  });

  factory Expense.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Expense(
      id: doc.id,
      date: data['date'],
      title: data['title'],
      description: data['description'],
      price: data['price'],
      categorie: data['category'],
    );
  }
}
