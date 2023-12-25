import 'package:get/get.dart';

import '../controllers/transaksiadmin_controller.dart';

class TransaksiadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiadminController>(
      () => TransaksiadminController(),
    );
  }
}
