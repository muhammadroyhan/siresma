import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/auth_service.dart';

class LoginViewModel extends GetxController {
  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String? validateUsername(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Username tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 8) {
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

  var isLoading = false.obs;
  final AuthService authService = AuthService();

  Future<void> login(String username, String password) async {
    isLoading(true);
    try {
      final response = await authService.login(username, password);
      if (response != null && response.success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.token);
        print(response.token);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Masuk Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(const Duration(seconds: 2), () {
          if (response.data.role == 'nasabah') {
            Get.offAllNamed('/usernavbar');
          } else {
            Get.offAllNamed('/adminnavbar');
          }
        });
        isLoading.value = true;
      } else {
        isLoading.value = false;
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Masuk Gagal",
          response!.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Masuk Gagal",
        'Pastikan Internet anda sudah dinyalakan',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void checkLogin(String username, String password) async {
    if (LoginFormKey.currentState != null &&
        LoginFormKey.currentState!.validate()) {
      LoginFormKey.currentState!.save();
      try {
        await login(username, password);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
