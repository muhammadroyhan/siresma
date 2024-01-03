import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController NamaLengkapCtrl = TextEditingController();
  TextEditingController UsernameCtrl = TextEditingController();
  TextEditingController NomorkkCtrl = TextEditingController();
  TextEditingController AlamatCtrl = TextEditingController();
  TextEditingController NomorTlpnCtrl = TextEditingController();
  TextEditingController PasswordCtrl = TextEditingController();

  String? validateNamaLengkap(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Nama tidak boleh kosong';
    }
    if (value.length >= 25) {
      return 'Teks tidak boleh lebih dari 25 karakter';
    }
    if (!RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
      return 'Teks hanya boleh mengandung huruf, spasi, dan titik';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Username tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateNomorKK(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Nomor KK tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 15)) {
      return "Nomor KK tidak boleh lebih dari 16 angka";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor HP hanya boleh mengandung angka';
    }
    {
      return null;
    }
  }

  String? validateAlamat(String value) {
    if (value == null || value.isEmpty || value == ' ') {
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
    if (!GetUtils.isLengthGreaterThan(value, 11)) {
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
    if (value == null || value.isEmpty || value == ' ') {
      return 'Kata sandi tidak boleh kosong';
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

  File? ImageFile;
  String? imageUrl;
  final _picker = ImagePicker();

  Future<void> imagepicker() async {
    var imagepicker = await _picker.pickImage(source: ImageSource.gallery);
    if (imagepicker != null) {
      ImageFile = File(imagepicker.path);
      update();
    }
  }

  Future<void> Register() async {
    try {
      var headers = {'Accept': 'application/json'};
      var request = https.MultipartRequest('POST', Uri.parse(API.register));
      request.fields.addAll({
        "username": UsernameCtrl.text.trim(),
        "full_name": NamaLengkapCtrl.text,
        "password": PasswordCtrl.text,
        "phone": NomorTlpnCtrl.text,
        "address": AlamatCtrl.text,
        "no_kk": NomorkkCtrl.text,
      });
      if (ImageFile != null) {
        request.files.add(await https.MultipartFile.fromPath(
            'profile_picture', ImageFile!.path));
      }
      request.headers.addAll(headers);
      https.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var responseData = json.decode(responseBody);
      var success = responseData['message'];
      var error = responseData['message'];

      if (response.statusCode == 200) {
        print(response);
        print(responseData);
        print(ImageFile);
        var id = responseData["data"];
        final SharedPreferences prefs = await _prefs;
        await prefs.setInt("id", id);
        print(id);
        customAllertDialog("Succes", "${success}", 'succes');
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/otp');
        });
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Pendaftaran Gagal", e.toString(), 'error');
    }
  }

  void checkRegister() async {
    if (registerFromKey.currentState!.validate()) {
      registerFromKey.currentState!.save();
      try {
        Register();
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
