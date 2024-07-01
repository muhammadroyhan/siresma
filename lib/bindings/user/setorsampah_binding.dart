import 'package:get/get.dart';
import 'package:siresma/view_models/user/setorsampah_view_model.dart';

class SetorSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetorSampahViewModel>(
      () => SetorSampahViewModel(),
    );
  }
}
