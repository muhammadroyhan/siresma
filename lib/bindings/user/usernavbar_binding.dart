import 'package:get/get.dart';
import 'package:siresma/view_models/user/home_view_model.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';
import 'package:siresma/view_models/user/setorsampah_view_model.dart';
import 'package:siresma/view_models/user/tabungansampah_view_model.dart';
import 'package:siresma/view_models/user/usernavbar_view_model.dart';

class UserNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNavbarViewModel>(
      () => UserNavbarViewModel(),
    );
    Get.lazyPut(
      () => HomeViewModel(),
    );
    Get.lazyPut(
      () => SetorSampahViewModel(),
    );
    Get.lazyPut(
      () => TabunganSampahViewModel(),
    );
    Get.lazyPut(
      () => ProfileViewModel(),
    );
  }
}
