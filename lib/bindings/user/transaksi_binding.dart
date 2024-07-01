import 'package:get/get.dart';
import 'package:siresma/view_models/user/transaksi_view_model.dart';

class TransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiViewModel>(
      () => TransaksiViewModel(),
    );
  }
}
