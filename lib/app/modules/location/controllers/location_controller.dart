import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';

import '../../../models/dropdown_location.dart';
import '../../../models/user.dart';
import '../../profil/controllers/profil_controller.dart';

class LocationController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final ProfilController ProfilCtrl = Get.put(ProfilController());
  var isLoading = true.obs;
  var rt = <RTModel>[].obs;
  RTModel? selectedRT;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.bank_sampah);
      https.Response response =
          await https.get(url, headers: headers); // Ganti dengan URL API Anda
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        List<RTModel> tempList = [];
        for (var item in jsonData['data']) {
          tempList.add(RTModel.fromJson(item));
        }
        rt.value = tempList;
        update();
        isLoading.value = false;
      } else {
        isLoading.value = false;

        print("Gagal");
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  void setSelectedRT(RTModel? newValue) {
    selectedRT = newValue;
    update(); // Manually call update to notify the UI of the change.
  }

  Future<void> postData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      if (selectedRT == null) {
        Get.snackbar(
          "Error",
          "Pilih Lokasi terlebih dahulu",
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = {
        'trash_bank_id': selectedRT!.id.toString(),
        // Add other data fields here if needed
      };
      var url =
          Uri.parse(API.choose_bank_sampah); // Replace with your POST API URL
      var response = await https.post(url, headers: headers, body: body);
      var succes = jsonDecode(response.body)['message'];

      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var trash_bank_id = json["data"];
        final SharedPreferences prefs = await _prefs;
        await prefs.setInt("trash_bank_id", trash_bank_id);
        print(trash_bank_id);
        print(json);
        customAllertDialog("Sukses", "${succes}", "succes");
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/navbar');
        });
      } else {
        customAllertDialog("Gagal", "${error}", 'error');
      }
    } catch (e) {
      customAllertDialog("Post Data Gagal", e.toString(), 'error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    ProfilCtrl.fetchData();
    fetchData();
    update();
  }

  @override
  void onReady() {
    ProfilCtrl.fetchData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
