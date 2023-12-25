import 'package:get/get.dart';

import '../controllers/number_controller.dart';

class NumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberController>(
      () => NumberController(),
    );
  }
}
