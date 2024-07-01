import 'package:get/get.dart';
import 'package:siresma/view_models/user/evoucher_view_model.dart';

class EvoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvoucherViewModel>(
      () => EvoucherViewModel(),
    );
  }
}
