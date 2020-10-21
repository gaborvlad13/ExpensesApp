import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class NotesBody extends StatelessWidget {
  final List<Note> _notes;
  NotesBody(this._notes);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      sliver: AnimationLimiter(
        child: SliverWaterfallFlow.count(
          children: List.generate(
            _notes.length,
            (index) => AnimationConfiguration.staggeredGrid(
              columnCount: 2,
              position: index,
              duration: const Duration(milliseconds: 375),
              child: FadeInAnimation(
                child: GridItemNote(_notes[index]),
              ),
            ),
          ),
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
      ),
    );
  }

  List<StaggeredTile> _tilesForView() {
    return List.generate(_notes.length, (index) {
      return StaggeredTile.fit(1);
    });
  }
}

/*


import 'package:ExpensesApp/models/note.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesBody extends StatelessWidget {
  final List<Note> _notes;
  NotesBody(this._notes);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      sliver: SliverStaggeredGrid.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        itemBuilder: (ctx, index) {
          return GridItemNote(_notes[index]);
        },
        itemCount: _notes.length,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      ),
    );
  }

  List<StaggeredTile> _tilesForView() {
    return List.generate(_notes.length, (index) {
      return StaggeredTile.fit(1);
    });
  }
}
 */
