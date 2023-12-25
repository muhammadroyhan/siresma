import 'package:get/get.dart';

import '../controllers/tabunganefore_controller.dart';

class TabunganbeforeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabunganbeforeController>(
      () => TabunganbeforeController(),
    );
  }
}
