import 'package:ExpensesApp/models/expense.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Database with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addExpense(String uid, Expense expense) async {
    await _firestore
        .collection("userData")
        .doc(uid)
        .collection("expenses")
        .add({
      'title': expense.title,
      'description': expense.description,
      'price': expense.price,
      'date': expense.date,
      'category': expense.category,
    });
  }

  void test() {
    final reference =
        _firestore.collection("userData").doc("ceva").collection("expenses");
    final snapshot = reference.snapshots();
    snapshot.forEach((element) {
      element.docs.forEach((element) {
        print(element.id);
      });
    });
  }

  List<Expense> _expenseListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((e) => Expense.fromFirestore(e)).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Expense>> getExpenses(String uid) {
    try {
      final reference = _firestore
          .collection("userData")
          .doc(uid)
          .collection("expenses");
      final snapshots = reference.snapshots();
      return snapshots.map((_expenseListFromSnapshot));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
