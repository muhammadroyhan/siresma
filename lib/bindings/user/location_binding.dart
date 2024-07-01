import 'package:get/get.dart';
import 'package:siresma/view_models/user/location_view_model.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationViewModel>(
      () => LocationViewModel(),
    );
  }
}
