import 'package:get/get.dart';
import 'package:siresma/view_models/user/tariktunai_view_model.dart';

class TariktunaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TariktunaiViewModel>(
      () => TariktunaiViewModel(),
    );
  }
}
