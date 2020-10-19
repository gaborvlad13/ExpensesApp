import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/providers/database_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  static const route = 'add-note-screen';
  final Note _note;
  AddNoteScreen(this._note);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _titleFocus = FocusNode();
  final _contentFocus = FocusNode();
  Note _editableNote;
  var isNewNote = false;

  @override
  void initState() {
    _titleController.text = widget._note.title;
    _contentController.text = widget._note.content;
    _editableNote = widget._note;
    if (_editableNote.id == "") isNewNote = true;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleFocus.dispose();
    _contentFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[100],
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveNote,
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  void _saveNote() {
    String title = _titleController.text;
    String content = _contentController.text;
    DatabaseNotes databaseNotes = DatabaseNotes();
    databaseNotes.addNote(Provider.of<UserLocal>(context, listen: false).uid,
        Note(title: title, content: content));
    Navigator.pop(context);
  }

  Widget _buildBody() {
    return Container(
      height: double.infinity,
      color: Colors.yellow[100],
      padding: EdgeInsets.only(left: 16, right: 16, top: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: ScreenUtil().setHeight(30),
              child: EditableText(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                controller: _titleController,
                focusNode: _titleFocus,
                style: _buildTextStyleTitle(),
                cursorColor: Colors.black,
                backgroundCursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_contentFocus),
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Container(
              height: ScreenUtil().setHeight(580),
              child: EditableText(
                textCapitalization: TextCapitalization.sentences,
                controller: _contentController,
                focusNode: _contentFocus,
                style: _buildTextStyleContent(),
                cursorColor: Colors.black,
                backgroundCursorColor: Colors.black,
                maxLines: 24,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _buildTextStyleTitle() {
    return TextStyle(
      color: Colors.black,
      fontSize: ScreenUtil().setSp(22),
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _buildTextStyleContent() {
    return TextStyle(
      color: Colors.black,
      fontSize: ScreenUtil().setSp(20),
    );
  }
}
