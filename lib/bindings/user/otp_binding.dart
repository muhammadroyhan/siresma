import 'package:get/get.dart';
import 'package:siresma/view_models/user/otp_view_model.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpViewModel>(
      () => OtpViewModel(),
    );
  }
}
