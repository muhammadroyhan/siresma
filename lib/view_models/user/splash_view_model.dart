import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAllNamed('/login'),
    );
    super.onInit();
  }
}
