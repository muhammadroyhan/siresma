import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/api.dart';

class DataNasabahController extends GetxController {
  RxList<Map<String, dynamic>> users = RxList<Map<String, dynamic>>();
  var isLoading = true.obs;

  Future<void> loadTransaksi() async {
    await getDataNasabah();
  }

  Future<void> getDataNasabah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.data_nasabah);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        users.assignAll(List<Map<String, dynamic>>.from(data));
        print(data);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  @override
  void onInit() {
    loadTransaksi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadTransaksi();
  }
}
