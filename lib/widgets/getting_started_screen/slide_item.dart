import 'package:ExpensesApp/controllers/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  final sliderController = SliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            color: Colors.teal,
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
    );
  }
}
