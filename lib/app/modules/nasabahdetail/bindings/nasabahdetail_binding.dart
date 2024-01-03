import 'package:get/get.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';

class NasabahDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NasabahDetailController>(
      () => NasabahDetailController(),
    );
  }
}
