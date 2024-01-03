import 'dart:async';

import 'package:get/get.dart';
import 'package:siresma/app/modules/splash/views/splash_view.dart';
import 'package:siresma/app/data/auto_login.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1800), () {
      checkToken();
    });
    super.onInit();
  }
}
