import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiMasukController extends GetxController {
  RxList transaksi = [].obs;

  Future<void> loadTransaksi() async {
    await getTransaksiMasuk();
  }

  Future<void> getTransaksiMasuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.transaksimasuk);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        transaksi.assignAll(List<Map<String, dynamic>>.from(data));
        print(data);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    loadTransaksi();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    loadTransaksi();
    update();
    super.onReady();
  }
}
