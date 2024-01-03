import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';

class TarikSaldoController extends GetxController {
  final GlobalKey<FormState> TarikSaldoFormKey = GlobalKey<FormState>();
  TextEditingController TarikSaldoCtrl = TextEditingController();

  String? validateTarikSaldo(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukan jumlah saldo yang ingin ditarik';
    }
    {
      return null;
    }
  }

  Future<void> PostData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var headers = {
        // 'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.transaksi);
      var body = {
        'amount': TarikSaldoCtrl.text,
      };
      https.Response response =
          await https.post(url, headers: headers, body: body);
      print(response.body);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print(responseJson);
        customAllertDialog("Sukses", "${succes}", 'success');
        Timer(Duration(seconds: 2), () {
          Get.back();
        });
      } else {
        customAllertDialog("Gagal", "${error}", 'error');
      }
    } catch (e) {
      customAllertDialog("Server Error", '${e}', 'error');
    }
  }

  void checkTransaksi() {
    if (TarikSaldoFormKey.currentState!.validate()) {
      TarikSaldoFormKey.currentState!.save();
      try {
        PostData();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
