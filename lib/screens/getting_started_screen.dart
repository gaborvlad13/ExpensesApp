import 'dart:async';

import 'package:ExpensesApp/screens/login_screen.dart';
import 'package:ExpensesApp/widgets/default_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/slider_controller.dart';
import '../widgets/getting_started_screen/slide_item.dart';
import '../widgets/getting_started_screen/slide_dots.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final _sliderController = SliderController();
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72, height: 713.45, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _sliderController.length,
                itemBuilder: (ctx, i) => SlideItem(i),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _sliderController.length; i++)
                    if (i == _currentPage) SlideDots(true) else SlideDots(false)
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(20),
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DefaultButton(
                    press: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    text: 'Getting started',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
