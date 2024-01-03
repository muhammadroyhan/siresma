import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/config/api.dart';

import '../../../common/custom_snackbar.dart';

class KeamananController extends GetxController {
  final GlobalKey<FormState> GantiPasswordFormKey = GlobalKey<FormState>();
  TextEditingController passwordBaruCtrl = TextEditingController();
  TextEditingController konfirmPasswordCtrl = TextEditingController();

  String? validatePasswordBaru(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukkan kata sandi baru';
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Minimal 8 karakter";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
      return "Minimal 1 huruf kecil";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
      return "Minimal 1 huruf Besar";
    }
    {
      return null;
    }
  }

  String? validateKonfirmPassword(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukan kata sandi';
    }
    if (value != passwordBaruCtrl.text) {
      return "Kata sandi tidak sama";
    }
    return null;
  }

  Future<void> PostData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.ganti_password);
      var body = {
        'new_password': passwordBaruCtrl.text,
      };
      https.Response response =
          await https.post(url, headers: headers, body: body);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print(responseBody);
        customAllertDialog("Sukses", "${succes}", 'success');
        Timer(Duration(seconds: 2), () {
          Get.back();
        });
      } else {
        customAllertDialog("Gagal", '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog('Server Error', '${e}', 'error');
    }
  }

  void checkPasswordBaru() {
    if (GantiPasswordFormKey.currentState!.validate()) {
      GantiPasswordFormKey.currentState!.save();
      try {
        PostData();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      return null;
    }
  }

  
}
