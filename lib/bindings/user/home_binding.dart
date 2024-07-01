import 'package:get/get.dart';
import 'package:siresma/view_models/user/home_view_model.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(),
    );
  }
}
