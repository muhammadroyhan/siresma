import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/models/user.dart';
import 'package:siresma/app/modules/login/controllers/login_controller.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  RxString name = ''.obs;

  // Jangan melakukan Get.put() pada saat inisialisasi
  late LoginController loginCtrl;

  @override
  void onInit() {
    super.onInit();

    // Pindahkan inisialisasi LoginController ke dalam metode onInit
    loginCtrl = Get.put(LoginController());

    // Tidak perlu fetchData di sini

    update(); // Panggil update jika Anda ingin memperbarui tampilan
  }

  @override
  void onReady() {
    super.onReady();

    // Tambahkan logika yang diperlukan di sini setelah widget siap
  }

  @override
  void onClose() {
    super.onClose();

    // Tambahkan logika pembersihan atau penutupan di sini jika diperlukan
  }
}
