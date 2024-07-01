import 'package:get/get.dart';
import 'package:siresma/view_models/admin/barcode_view_model.dart';

class BarcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarcodeViewModel>(
      () => BarcodeViewModel(),
    );
  }
}
