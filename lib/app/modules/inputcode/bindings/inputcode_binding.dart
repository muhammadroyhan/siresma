import 'package:get/get.dart';
import 'package:siresma/app/modules/inputcode/controllers/inputcode_controller.dart';


class InputCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputCodeController>(
      () => InputCodeController(),
    );
  }
}
