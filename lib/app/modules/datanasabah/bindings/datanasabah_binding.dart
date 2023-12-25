import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';

class DataNasabahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataNasabahController>(
      () => DataNasabahController(),
    );
  }
}
