import 'package:get/get.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileViewModel>(
      ProfileViewModel(),
    );
  }
}
