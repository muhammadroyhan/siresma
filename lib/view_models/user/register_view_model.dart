import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/auth_service.dart';

class RegisterViewModel extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController namalengkapCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController noKkCtrl = TextEditingController();
  TextEditingController alamatCtrl = TextEditingController();
  TextEditingController noHpCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String? validateNamaLengkap(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Nama tidak boleh kosong';
    }
    if (value.length > 25) {
      return 'Teks tidak boleh lebih dari 25 karakter';
    }
    if (!RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
      return 'Teks hanya boleh mengandung huruf, spasi, dan titik';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Username tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateNomorKK(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Nomor KK tidak boleh kosong';
    }
    if (value.length > 16) {
      return "Nomor KK tidak boleh lebih dari 16 angka";
    }
    if (value.length < 16) {
      return "Nomor KK tidak boleh kurang dari 16 angka";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor HP hanya boleh mengandung angka';
    }
    {
      return null;
    }
  }

  String? validateAlamat(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Alamat tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateNomorHp(String value) {
    if (value == ' ') {
      return 'Nomor Handpone tidak boleh kosong';
    }
    if (value.length < 12) {
      return "Nomor HP tidak boleh lebih dari 12 angka";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor HP hanya boleh mengandung angka';
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

  File? profilePicture;
  String? imageUrl;
  final _picker = ImagePicker();

  Future<void> imagepicker() async {
    var imagepicker = await _picker.pickImage(source: ImageSource.gallery);
    if (imagepicker != null) {
      profilePicture = File(imagepicker.path);
      update();
    }
  }

  var isLoading = false.obs;
  final AuthService authService = AuthService();

  Future<void> register(
    String namalengkap,
    String username,
    String nokk,
    String alamat,
    String nohp,
    String password,
  ) async {
    isLoading(true);
    try {
      final response = await authService.register(
          namalengkap, username, nokk, alamat, nohp, password, profilePicture);
      if (response != null && response.success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('user_id', response.data);
        print(response.data);
        print(response.message);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Pendaftaran Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(
          const Duration(seconds: 2),
          () {
            Get.offAllNamed('/otp');
          },
        );
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Pendaftaran Gagal",
          response!.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Pendaftaran Gagal",
        "Pastikan Memasukkan Data dengan benar",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading(false);
    }
  }

  void checkRegister(
    String namalengkap,
    String username,
    String nokk,
    String alamat,
    String nohp,
    String password,
  ) async {
    if (registerFormKey.currentState != null &&
        registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      try {
        await register(namalengkap, username, nokk, alamat, nohp, password);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
