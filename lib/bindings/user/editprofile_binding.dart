import 'package:get/get.dart';
import 'package:siresma/view_models/user/editprofile_view_model.dart';

class EditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditprofileViewModel>(
      () => EditprofileViewModel(),
    );
  }
}
