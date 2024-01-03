import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/models/user.dart';
import 'package:siresma/app/modules/login/controllers/login_controller.dart';

import '../../../config/api.dart';
import '../../../models/location.dart';
import '../../profil/controllers/profil_controller.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = true.obs;

  RxString name = ''.obs;

  final LoginController LoginCtrl = Get.put(LoginController());

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.home);
      https.Response response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          name.value = jsonResponse['data']['name'];
          var trash_bank_id = jsonResponse['data']['id'];
          final SharedPreferences prefs = await _prefs;
          await prefs.setInt("trash_bank_id", trash_bank_id);
          // UserList.location = name.value;
          print(trash_bank_id);
          print(jsonResponse);
          print(name.value);
          update();
          isLoading.value = false;
        }
      } else {
        isLoading.value = false;
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      isLoading.value = false;
      print('Error during HTTP request: $error');
    }
  }

  late Timer _autoLogoutTimer; // New line

  void _startAutoLogoutTimer() {
    _autoLogoutTimer = Timer(Duration(minutes: 60), () {
      LoginCtrl.Logout(); // Call the logout function after 60 minutes
      _autoLogoutTimer.cancel();
    });
  }

  @override
  void onInit() {
    super.onInit();
    _startAutoLogoutTimer();
    fetchData();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
