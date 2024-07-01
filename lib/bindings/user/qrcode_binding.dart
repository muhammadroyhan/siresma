import 'package:get/get.dart';
import 'package:siresma/view_models/user/qrcode_view_model.dart';

class QrcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrcodeViewModel>(
      () => QrcodeViewModel(),
    );
  }
}
