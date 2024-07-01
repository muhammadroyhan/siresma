import 'package:get/get.dart';
import 'package:siresma/view_models/admin/transaksi_admin_view_model.dart';

class TransaksiAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiAdminViewModel>(
      () => TransaksiAdminViewModel(),
    );
  }
}
