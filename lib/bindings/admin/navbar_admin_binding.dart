import 'package:get/get.dart';
import 'package:siresma/view_models/admin/barcode_view_model.dart';
import 'package:siresma/view_models/admin/nasabah_view_model.dart';
import 'package:siresma/view_models/admin/navbar_admin_view_model.dart';
import 'package:siresma/view_models/admin/transaksi_keluar_view_model.dart';
import 'package:siresma/view_models/admin/transaksi_masuk_view_model.dart';

class NavbarAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarAdminViewModel>(
      () => NavbarAdminViewModel(),
    );
    Get.lazyPut(
      () => NasabahViewModel(),
    );
    Get.lazyPut(
      () => TransaksiMasukViewModel(),
    );
    Get.lazyPut(
      () => TransaksiKeluarViewModel(),
    );
    Get.lazyPut(
      () => BarcodeViewModel(),
    );
  }
}
