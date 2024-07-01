import 'package:get/get.dart';
import 'package:siresma/view_models/admin/nasabah_view_model.dart';

class NasabahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NasabahViewModel>(
      () => NasabahViewModel(),
    );
  }
}
