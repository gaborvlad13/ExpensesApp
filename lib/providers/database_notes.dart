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

  Future deleteNote(String uid, String noteId) async {
    var result = await _firestore
        .collection("userData")
        .doc(uid)
        .collection("notes")
        .doc(noteId)
        .delete();
    return result;
  }

  Future updateNote(String uid, String id, Note note) async {
    await _firestore
        .collection("userData")
        .doc(uid)
        .collection("notes")
        .doc(id)
        .update({
      'title': note.title,
      'content': note.content,
    });
    return true;
  }

  List<Note> _noteListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((n) => Note.fromFirestore(n)).toList();
    } catch (e) {
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
      return null;
    }
  }
}
