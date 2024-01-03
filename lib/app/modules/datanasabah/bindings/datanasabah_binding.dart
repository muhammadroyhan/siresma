import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';

class DataNasabahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataNasabahController>(
      () => DataNasabahController(),
    );
  }
}
