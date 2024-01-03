import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

import '../../../models/user.dart';

class ProfilController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = true.obs;
  RxString name = ''.obs;
  RxString role = ''.obs;
  RxString phone = ''.obs;
  RxString location = ''.obs;
  RxString address = ''.obs;
  RxString no_kk = ''.obs;
  RxString profil_picture = ''.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.get_profile);
      https.Response response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          name.value = jsonResponse['data']['full_name'];
          role.value = jsonResponse['data']['role'];
          phone.value = jsonResponse['data']['phone'];
          location.value = jsonResponse['data']['location'];
          address.value = jsonResponse['data']['address'];
          no_kk.value = jsonResponse['data']['no_kk'];
          profil_picture.value = jsonResponse['data']['profile_picture'];

          print(name.value);
          print(role.value);
          print(phone.value);
          print(location.value);
          print(address.value);
          print(no_kk.value);
          print(profil_picture.value);
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

  @override
  void onInit() {
    fetchData();
    update();
    super.onInit();
  }
}
