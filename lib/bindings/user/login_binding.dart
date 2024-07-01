import 'package:get/get.dart';
import 'package:siresma/view_models/user/login_view_model.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(
      () => LoginViewModel(),
    );
  }
}
