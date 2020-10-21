import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/screens/add_note_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class GridItemNote extends StatelessWidget {
  final Note _note;
  GridItemNote(this._note);

  @override
  Widget build(BuildContext context) {
    var fontSize = _determineFontSizeForContent();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNoteScreen(_note),
          ),
        );
      },
      child: Hero(
        tag: _note.id,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(8),
              vertical: ScreenUtil().setHeight(8),
            ),
            child: _buildChild(fontSize),
          ),
          color: Colors.yellow[100],
        ),
      ),
    );
  }

  Widget _buildChild(fontSize) {
    List<Widget> contentsOfTiles = [];
    if (_note.title.length != 0) {
      contentsOfTiles.add(
        Text(
          _note.title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          maxLines: _note.title.length == 0 ? 1 : 3,
          textScaleFactor: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
      );
      contentsOfTiles.add(
        SizedBox(
          height: ScreenUtil().setHeight(12),
        ),
      );
    }
    contentsOfTiles.add(
      Text(
        _note.content,
        style: TextStyle(fontSize: fontSize),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1.5,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: contentsOfTiles,
    );
  }

  double _determineFontSizeForContent() {
    int charCount = _note.content.length + _note.title.length;
    double fontSize = ScreenUtil().setSp(20);
    if (charCount > 110) {
      fontSize = ScreenUtil().setSp(12);
    } else if (charCount > 80) {
      fontSize = ScreenUtil().setSp(14);
    } else if (charCount > 50) {
      fontSize = ScreenUtil().setSp(16);
    } else if (charCount > 20) {
      fontSize = ScreenUtil().setSp(18);
    }
    return fontSize;
  }
}
