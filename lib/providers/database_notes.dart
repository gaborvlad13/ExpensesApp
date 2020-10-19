import 'package:ExpensesApp/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseNotes {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addNote(String uid, Note note) async {
    await _firestore.collection("userData").doc(uid).collection("notes").add(
      {
        'title': note.title,
        'content': note.content,
        'dateAddedInApp': Timestamp.fromDate(DateTime.now()),
      },
    );

    return true;
  }

  /*Future deleteExpense(String uid, String expenseId) async {
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
  }*/

  List<Note> _noteListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((n) => Note.fromFirestore(n)).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Note>> getNotes(String uid) {
    try {
      final reference = _firestore
          .collection("userData")
          .doc(uid)
          .collection("notes")
          .orderBy(
            "dateAddedInApp",
            descending: true,
          );
      final snapshots = reference.snapshots();
      return snapshots.map((_noteListFromSnapshot));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
