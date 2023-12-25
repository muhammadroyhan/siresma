import 'package:get/get.dart';

import '../controllers/privasi_controller.dart';

class PrivasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivasiController>(
      () => PrivasiController(),
    );
  }
}
