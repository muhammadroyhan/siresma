import 'package:get/get.dart';
import 'package:siresma/view_models/admin/transaksi_keluar_view_model.dart';

class TransaksiKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiKeluarViewModel>(
      () => TransaksiKeluarViewModel(),
    );
  }
}
