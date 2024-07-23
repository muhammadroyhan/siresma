import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  final String? role = prefs.getString("role");
  final String? trash_bank_id = prefs.getString("trash_bank_id");

  if (token != null) {
    print(token);
    print(role);
    print(trash_bank_id);
    if (role == 'nasabah') {
      Get.offAllNamed('/usernavbar');
    } else if (role == 'pengelola') {
      Get.offAllNamed('/adminnavbar');
    }
  } else {
    Get.offAllNamed('/login');
  }
}
