import 'package:get/get.dart';
import 'package:siresma/view_models/user/register_view_model.dart';



class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterViewModel>(
      () => RegisterViewModel(),
    );
  }
}
