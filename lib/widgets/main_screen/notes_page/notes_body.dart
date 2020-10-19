import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesBody extends StatelessWidget {
  List<Note> _notes;
  NotesBody(this._notes);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      children: List.generate(
        _notes.length,
        (index) => GridItemNote(_notes[index]),
      ),
      staggeredTiles: _tilesForView(),
    );
  }

  List<StaggeredTile> _tilesForView() {
    return List.generate(_notes.length, (index) {
      return StaggeredTile.fit(1);
    });
  }
}
