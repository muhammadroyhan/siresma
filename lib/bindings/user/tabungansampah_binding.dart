import 'package:get/get.dart';
import 'package:siresma/view_models/user/tabungansampah_view_model.dart';

class TabunganSampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabunganSampahViewModel>(
      () => TabunganSampahViewModel(),
    );
  }
}
