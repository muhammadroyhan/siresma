import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final String? role = prefs.getString('role');

  if (token != null) {
    print(token);
    if (role == 'nasabah') {
      Timer(Duration(seconds: 2), () {
        Get.offAllNamed('/navbar');
      });
    } else if (role == 'pengelola') {
      Timer(Duration(seconds: 2), () {
        Get.offAllNamed('/navbaradmin');
      });
    }
  } else {
    Get.offAllNamed('/login');
  }
}
