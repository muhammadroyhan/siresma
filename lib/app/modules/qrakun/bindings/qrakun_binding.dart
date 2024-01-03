import 'package:get/get.dart';

import '../controllers/qrakun_controller.dart';

class QrAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrAkunController>(
      () => QrAkunController(),
    );
  }
}
