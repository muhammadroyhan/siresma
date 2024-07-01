import 'package:get/get.dart';
import 'package:siresma/view_models/user/splash_view_model.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(
      () => SplashViewModel(),
    );
  }
}
