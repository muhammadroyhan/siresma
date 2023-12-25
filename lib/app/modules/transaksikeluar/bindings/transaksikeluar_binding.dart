import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';
import 'package:siresma/app/modules/transaksikeluar/controllers/transaksikeluar_controller.dart';
import 'package:siresma/app/modules/transaksimasuk/controllers/transaksimasuk_controller.dart';

class TransaksiKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiKeluarController>(
      () => TransaksiKeluarController(),
    );
  }
}
