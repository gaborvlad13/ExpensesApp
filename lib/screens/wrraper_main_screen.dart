import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/providers/database_notes.dart';
import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrraperMainScreen extends StatelessWidget {
  final _db = Database();
  final _dbNotes = DatabaseNotes();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Expense>>.value(
          initialData: [
            Expense(
              id: "initial",
              category: "",
              date: DateTime.now(),
              description: "",
              price: 0.00,
              title: "",
            ),
          ],
          value: _db.getExpenses(Provider.of<UserLocal>(context).uid),
        ),
        StreamProvider<List<Note>>.value(
          initialData: [
            Note(
              id: "initial",
            ),
          ],
          value: _dbNotes.getNotes(Provider.of<UserLocal>(context).uid),
        ),
  
      ],
      child: MainScreen(),
    );
  }
}
