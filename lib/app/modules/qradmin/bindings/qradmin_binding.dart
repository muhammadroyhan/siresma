import 'package:get/get.dart';

import '../controllers/qradmin_controller.dart';

class QrAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrAdminController>(
      () => QrAdminController(),
    );
  }
}
