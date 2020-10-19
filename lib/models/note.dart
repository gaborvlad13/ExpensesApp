import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String title;
  String content;
  Note({
    this.id,
    this.title,
    this.content,
  });

  factory Note.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Note(
      id: doc.id,
      title: data['title'],
      content: data['content'],
    );
  }
}
