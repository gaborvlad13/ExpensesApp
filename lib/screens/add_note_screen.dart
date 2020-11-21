import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _db = DatabaseNotes();
  Note _editableNote;
  var _isNewNote = false;

  @override
  void initState() {
    _editableNote = widget._note;
    if (_editableNote.id.isEmpty)
      _isNewNote = true;
    else {
      _titleController.text = widget._note.title;
      _contentController.text = widget._note.content;
    }
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: ScreenUtil().setSp(20),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.yellow[100],
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete,
                size: ScreenUtil().setSp(25),
              ),
              onPressed: _deleteNode,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.save,
                  size: ScreenUtil().setSp(25),
                ),
                onPressed: () => _saveNote(context),
              ),
            ),
          ],
        ),
        body: Hero(
          tag: _editableNote.id,
          child: _buildBody(),
        ),
      ),
    );
  }

  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            "Content must not be empty",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
            ),
          ),
          actions: [
            InkWell(
              child: Text(
                "Got it",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: kPrimaryColor,
                ),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveNote(BuildContext ctx) async {
    String title = _titleController.text;
    String content = _contentController.text;
    if (content.isEmpty) {
      await _showDialog();
      return;
    }
    final userProvider = Provider.of<UserLocal>(context, listen: false);
    if (_isNewNote)
      _db.addNote(userProvider.uid, Note(title: title, content: content));
    else
      _db.updateNote(userProvider.uid, _editableNote.id,
          Note(title: title, content: content));
    Navigator.pop(context);
  }

  void _deleteNode() async {
    final userProvider = Provider.of<UserLocal>(context, listen: false);
    if (!_isNewNote)
      _db.deleteNote(
        userProvider.uid,
        _editableNote.id,
      );
    Navigator.pop(context);
  }

  Widget _buildBody() {
    return Material(
      child: Container(
        height: double.infinity,
        color: Colors.yellow[100],
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(5),
          right: ScreenUtil().setWidth(5),
          bottom: ScreenUtil().setHeight(5),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: _buildInputDecoration("Note title (max 30 chars)"),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                maxLines: 1,
                maxLengthEnforced: true,
                textCapitalization: TextCapitalization.sentences,
                controller: _titleController,
                focusNode: _titleFocus,
                style: _buildTextStyleTitle(),
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_contentFocus),
              ),
              Divider(
                color: Colors.grey[300],
              ),
              TextField(
                decoration:
                    _buildInputDecoration("Note content (max 1000 chars)"),
                maxLength: 1000,
                maxLengthEnforced: true,
                textCapitalization: TextCapitalization.sentences,
                controller: _contentController,
                focusNode: _contentFocus,
                style: _buildTextStyleContent(),
                maxLines: 60,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => {},
              ),
            ],
          ),
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

  InputDecoration _buildInputDecoration(String hintText) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
    );
    return InputDecoration(
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(20),
        fontWeight: FontWeight.normal,
        color: Colors.black12,
      ),
      hintText: hintText,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }
}
