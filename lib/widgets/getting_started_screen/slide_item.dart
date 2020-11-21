import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/controllers/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  final sliderController = SliderController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(5),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setWidth(200),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(sliderController.sliders[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              Text(
                sliderController.sliders[index].title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                sliderController.sliders[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(15),
                ),
              )
            ],
          ),
        ));
  }
}
