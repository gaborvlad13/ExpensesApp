import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  String id;
  DateTime date;
  String title;
  String description;
  double price;
  String category;
  Expense({
    this.id,
    this.title,
    this.description,
    this.price,
    this.date,
    this.category,
  });

  factory Expense.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Expense(
      id: doc.id,
      date: data['date'].toDate(),
      title: data['title'],
      description: data['description'],
      price: data['price'],
      category: data['category'],
    );
  }
}
