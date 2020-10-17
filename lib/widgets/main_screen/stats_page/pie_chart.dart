import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_presentation.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/pie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'indicator.dart';

class PierChartWidget extends StatefulWidget {
  final List<ExpenseDTO> _expensesDTO;
  PierChartWidget(this._expensesDTO);
  @override
  _PierChartWidgetState createState() => _PierChartWidgetState();
}

class _PierChartWidgetState extends State<PierChartWidget> {
  int _touchIndex = -1;

  void modifyState(int index) {
    setState(() {
      _touchIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_touchIndex);
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Container(
            height: ScreenUtil().setHeight(270),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*Container(
                  width: ScreenUtil().setWidth(250),
                  child: PieChart(
                    //durat
                    PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                        sections: showingSections()),
                  ),
                ),*/

                Pie(widget._expensesDTO, _touchIndex),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              modifyState(index);
                            },
                            child: Indicator(
                              color: Categories
                                  .categories[widget._expensesDTO[index].name]
                                  .color,
                              text: widget._expensesDTO[index].name,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          )
                        ],
                      );
                    },
                    itemCount: widget._expensesDTO.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        _touchIndex != -1
            ? CategoryPresentation(widget._expensesDTO[_touchIndex])
            : _buildNullPresentation(),
      ],
    );
  }

  Widget _buildNullPresentation() {
    return Card(
      child: Container(
        height: ScreenUtil().setSp(90),
        width: double.infinity,
        child: Center(
          child: Text(
            "Select a category",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: ScreenUtil().setSp(25),
            ),
          ),
        ),
      ),
    );
  }

  /*List<PieChartSectionData> showingSections() {
    return List.generate(Categories.categories.length, (i) {
      final isTouched = i == _touchIndex;
      final double radius =
          isTouched ? ScreenUtil().setWidth(110) : ScreenUtil().setWidth(100);
      var name = widget._expensesDTO[i].name;
      var total = widget._expensesDTO[i].total;

      return PieChartSectionData(
        color: Categories.categories[name].color,
        value: total,
        showTitle: false,
        radius: radius,
      );
    });
  }*/
}
