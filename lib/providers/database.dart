import 'package:ExpensesApp/models/expense.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addExpense(String uid, Expense expense) async {
    await _firestore.collection("userData").doc(uid).collection("expenses").add(
      {
        'title': expense.title,
        'description': expense.description,
        'price': expense.price,
        'date': Timestamp.fromDate(expense.date),
        'category': expense.category,
        'dateAddedInApp': Timestamp.fromDate(DateTime.now()),
      },
    );

    return true;
  }

  Future deleteExpense(String uid, String expenseId) async {
    var result = await _firestore
        .collection("userData")
        .doc(uid)
        .collection("expenses")
        .doc(expenseId)
        .delete();
    return result;
  }

  Future updateExpense(String uid, String id, Expense expense) async {
    await _firestore
        .collection("userData")
        .doc(uid)
        .collection("expenses")
        .doc(id)
        .update({
      'title': expense.title,
      'description': expense.description,
      'price': expense.price,
      'date': Timestamp.fromDate(expense.date),
      'category': expense.category,
    });
    return true;
  }

  List<Expense> _expenseListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((e) => Expense.fromFirestore(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Stream<List<Expense>> getExpenses(String uid) {
    try {
      final reference = _firestore
          .collection("userData")
          .doc(uid)
          .collection("expenses")
          .orderBy(
            "dateAddedInApp",
            descending: true,
          );
      final snapshots = reference.snapshots();
      return snapshots.map((_expenseListFromSnapshot));
    } catch (e) {
      return null;
    }
  }
}
