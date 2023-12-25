import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';

import '../../../config/api.dart';
import '../../../models/datanasabah.dart';
import '../../../models/user.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String? validateUsername(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username tidak boleh kosong';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Minimal 8 karakter";
    }
    if (!RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
      return "Minimal 1 huruf kecil";
    }
    if (!RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
      return "Minimal 1 huruf besar";
    }
    return null;
  }

  Future<void> login() async {
    var headers = {
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse(API.login);
      Map<String, String> body = {
        "username": usernameCtrl.text.trim(),
        "password": passwordCtrl.text,
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json.containsKey("token")) {
          var token = json["token"];
          var role = json["data"]['role'];
          final SharedPreferences prefs = await _prefs;
          await prefs.setString("token", token);
          await prefs.setString("role", role);
          customAllertDialog("Sukses", "Sukses melakukan login", 'success');
          Timer(Duration(seconds: 2), () {
            Get.offAllNamed(role == "nasabah" ? '/navbar' : '/navbaradmin');
          });
        } else {
          customAllertDialog('Gagal', 'Gagal melakukan login', 'error');
        }
      } else {
        customAllertDialog('Gagal', 'Gagal melakukan login', 'error');
      }
    } catch (error) {
      customAllertDialog('Gagal', error.toString(), 'error');
    }
  }

  Future<void> Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.logout);
      var response = await https.get(url, headers: headers);
      var succes = jsonDecode(response.body)['message'];
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        customAllertDialog("Sukses", "${succes}", 'Sukses');
        final SharedPreferences prefs = await _prefs;
        await prefs.remove("token");
        await prefs.remove("role");
        print(token);
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        customAllertDialog("Gagal", "${error}", "gagal");
      }
    } catch (e) {
      customAllertDialog("Gagal", "${e}", "gagal");
    }
  }

  void checkLogin() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        login();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  

  @override
  void onInit() {
    super.onInit();
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
