import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/config/api.dart';
import 'package:siresma/app/models/user.dart';
import 'package:siresma/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';

import '../../../common/custom_snackbar.dart';

class EditProfilController extends GetxController {
  final GlobalKey<FormState> editprofilFormKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final ProfilController ProfilCtrl = Get.put(ProfilController());

  String? validateNamaLengkap(String value) {
    if (value == ' ') {
      return 'Nama Lengkap tidak boleh kosong';
    }
    if (value.length >= 25) {
      return 'Teks tidak boleh lebih dari 25 karakter';
    }
    if (!RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
      return 'Teks hanya boleh mengandung huruf, spasi, dan titik';
    }
    return null;
  }

  String? validateAlamat(String value) {
    if (value == ' ') {
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

  Future<void> UpdateProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request =
          https.MultipartRequest('POST', Uri.parse(API.update_profil));
      request.fields.addAll({
        "full_name": nameCtrl.text,
        "address": addressCtrl.text,
        "phone": phoneCtrl.text,
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
        customAllertDialog("Succes", "${success}", 'succes');
        Timer(Duration(seconds: 2), () {
          Get.back();
        });
        ProfilCtrl.fetchData();
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Server Error", e.toString(), 'error');
    }
  }

  void checkUpdateprofile() async {
    if (editprofilFormKey.currentState!.validate()) {
      editprofilFormKey.currentState!.save();
      try {
        await UpdateProfile();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
