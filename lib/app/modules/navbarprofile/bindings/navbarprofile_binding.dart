import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/home/controllers/home_controller.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:siresma/app/modules/tabunganbefore/controllers/tabunganefore_controller.dart';

import '../../setor/controllers/setor_controller.dart';
import '../controllers/navbarprofile_controller.dart';

class NavbarProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarProfilController>(
      () => NavbarProfilController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SetorController>(
      () => SetorController(),
    );
    Get.lazyPut<TabunganbeforeController>(
      () => TabunganbeforeController(),
    );
  }
}
