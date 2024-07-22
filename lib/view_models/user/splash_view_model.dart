import 'package:get/get.dart';
import 'package:siresma/config/auto_login.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () => checkToken()
    );
    // Future.delayed(
    //   Duration(seconds: 2),
    //   () => Get.offAllNamed('/login'),
    // );
    super.onInit();
  }
}
