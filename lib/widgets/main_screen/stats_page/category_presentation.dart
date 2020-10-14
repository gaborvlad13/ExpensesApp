import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_information.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_lead.dart';
import 'package:flutter/material.dart';

class CategoryPresentation extends StatelessWidget {
  final String _categoryName;
  final double _totalPrice;
  final Expense _mostExpensive;
  final Expense _leastExpensive;
  final Expense _mostRecent;

  const CategoryPresentation(
    this._categoryName,
    this._totalPrice,
    this._mostExpensive,
    this._leastExpensive,
    this._mostRecent,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          CategoryLead(
            Categories.categories[_categoryName].color,
            Categories.categories[_categoryName].icon,
            Categories.categories[_categoryName].name,
          ),
          SizedBox(
            width: 8,
          ),
          CategoryInformation(
            _totalPrice,
            _mostExpensive,
            _leastExpensive,
            _mostRecent,
          )
        ],
      ),
    );
  }
}
