import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GridItem extends StatelessWidget {
  final double _height;
  final double _width;
  final String _id;
  final String _title;
  final String _description;
  final double _price;
  final DateTime _date;
  final String _categoryName;
  final _numberFormatter = NumberFormat.compact();
  GridItem(
    this._height,
    this._width,
    this._id,
    this._title,
    this._description,
    this._price,
    this._date,
    this._categoryName,
  );

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
            tag: _id,
            child: _buildHeader(),
          ),
          SizedBox(
            height: _height * 0.035,
          ),
          _buildTitle(),
          SizedBox(
            height: _height * 0.035,
          ),
          _buildDescription(),
          SizedBox(
            height: _height * 0.03,
          ),
          _buildBottom()
        ],
      ),
    );
  }

  Widget _buildBottom() {
    var price = _numberFormatter.format(_price);
    return Container(
      height: _height * 0.13,
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildColumnBottom(
            "PRICE:",
            "$price RON",
          ),
          _buildColumnBottom(
            "DATE:",
            DateFormat("dd.MM.yyy").format(_date),
          )
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: _height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Categories.categories[_categoryName].color,
      ),
      child: Icon(
        Categories.categories[_categoryName].icon,
        color: Colors.white,
        size: ScreenUtil().setSp(40),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      height: _height * 0.16,
      child: Text(
        "$_title",
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: kGridTitleColor,
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      height: _height * 0.16,
      child: Text(
        "$_description",
        style: TextStyle(
          color: Colors.black45,
          fontSize: ScreenUtil().setSp(15),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  _buildColumnBottom(String title, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black45,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
        Text(
          data,
          style: TextStyle(
            color: kGridTitleColor,
            fontSize: ScreenUtil().setSp(14),
          ),
        ),
      ],
    );
  }
}
