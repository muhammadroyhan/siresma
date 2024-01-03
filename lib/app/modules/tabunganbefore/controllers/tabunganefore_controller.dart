import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/config/api.dart';

import '../../../models/tabungan_sampah.dart'; // Pastikan path ini sesuai dengan lokasi model class

class TabunganbeforeController extends GetxController {
  var trashData =
      <TrashStoreLog>[].obs; // Menggunakan TrashStoreLog sebagai tipe list
  RxString user_balance = ''.obs;
  var isLoading = true.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.list_sampah);
      final response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        final trashModel = TrashStoreResponse.fromJson(
            responseJson); // Menggunakan TrashStoreResponse
        user_balance.value = json.encode(responseJson['data']['user_balance']);
        trashModel.data.trashStoreLogs.sort((a, b) {
          if (a.status == 'Masih dalam Proses' &&
              b.status != 'Masih dalam Proses') {
            return -1; // Move 'Masih dalam Proses' status items to the top
          } else if (a.status != 'Masih dalam Proses' &&
              b.status == 'Masih dalam Proses') {
            return 1;
          } else {
            return 0;
          }
        });
        print(responseJson);
        trashData.value =
            trashModel.data.trashStoreLogs; // Menggunakan data.trashStoreLogs
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print('Error fetching data: ${response.body}');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching data: $e');
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
