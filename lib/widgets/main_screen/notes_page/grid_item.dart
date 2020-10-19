import 'package:ExpensesApp/models/note.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class GridItemNote extends StatelessWidget {
  final Note _note;
  double _fontSize;
  GridItemNote(this._note);

  @override
  Widget build(BuildContext context) {
    _fontSize = _determineFontSizeForContent();
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: EdgeInsets.all(8),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    List<Widget> contentsOfTiles = [];
    if (_note.title.length != 0) {
      contentsOfTiles.add(
        AutoSizeText(
          _note.title,
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.bold,
          ),
          maxLines: _note.title.length == 0 ? 1 : 3,
          textScaleFactor: 1.5,
        ),
      );
      contentsOfTiles.add(
        Divider(
          color: Colors.transparent,
          height: ScreenUtil().setHeight(6),
        ),
      );
    }
    contentsOfTiles.add(
      AutoSizeText(
        _note.content,
        style: TextStyle(fontSize: _fontSize),
        maxLines: 10,
        textScaleFactor: 1.5,
      ),
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: contentsOfTiles,
      ),
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
