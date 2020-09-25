import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridItem extends StatelessWidget {
  final String _name;
  final String _description;
  final double _price;
  final String _categoryName;
  GridItem(this._name, this._description, this._price, this._categoryName);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Column(
        children: [
          Hero(
            tag: _name,
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                gradient: Categories.categories[_categoryName].linearGradient,
              ),
              child: Icon(
                Categories.categories[_categoryName].icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "$_name",
            style: TextStyle(
                color: Color(0xFF525252),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "$_description",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PRICE:",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "$_price RON",
                    style: TextStyle(
                      color: Color(0xFF525252),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "DATE:",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "23.05.2021",
                    style: TextStyle(
                      color: Color(0xFF525252),
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
