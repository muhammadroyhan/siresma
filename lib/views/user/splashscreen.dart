import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/splash_view_model.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor1,
                    primaryColor2,
                  ]),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/Logo.png',
                    scale: 1.dm,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                  Text(
                    'SIRESMA',
                    style: AppStyle(28.sp, Colors.white, FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
