import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/screens/add_note_screen.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/app_bar_notes.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/notes_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<List<Note>>(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        AppBarWidgetNotes(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(
                Note(id: ""),
              ),
            ),
          );
        }),
        NotesManager(notes),
      ],
    );
  }
}
