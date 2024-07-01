import 'package:get/get.dart';
import 'package:siresma/view_models/admin/transaksi_masuk_view_model.dart';

class TransaksiMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiMasukViewModel>(
      () => TransaksiMasukViewModel(),
    );
  }
}
