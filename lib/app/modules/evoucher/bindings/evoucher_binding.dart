import 'package:get/get.dart';

import '../controllers/evoucher_controller.dart';

class EvoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvoucherController>(
      () => EvoucherController(),
    );
  }
}
