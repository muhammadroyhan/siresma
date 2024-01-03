import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';
import 'package:siresma/app/modules/transaksimasuk/controllers/transaksimasuk_controller.dart';

class TransaksiMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiMasukController>(
      () => TransaksiMasukController(),
    );
  }
}
