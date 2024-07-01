import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/auth_service.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';
import 'package:siresma/view_models/user/usernavbar_view_model.dart';

class EditprofileViewModel extends GetxController {
  final ProfileViewModel profileViewModel = Get.put(ProfileViewModel());
  final UserNavbarViewModel userNavbarViewModel =
      Get.put(UserNavbarViewModel());
  final GlobalKey<FormState> EditProfileFormKey = GlobalKey<FormState>();
  TextEditingController namalengkapCtrl = TextEditingController();
  TextEditingController alamatCtrl = TextEditingController();
  TextEditingController noHpCtrl = TextEditingController();

  String? validateNamaLengkap(String value) {
    if (value == ' ') {
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

  Future<void> EditProfil(
    String fullname,
    String addres,
    String phone,
  ) async {
    // isLoading(true);
    try {
      final response =
          await authService.editProfil(fullname, addres, phone, profilePicture);
      if (response!.success) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Edit Profil Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        await profileViewModel.FetchUserProfile();
        Timer(
          const Duration(seconds: 2),
          () {
            Get.back();
          },
        );
        // isLoading.value = true;
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Edit Profil Gagal",
          response.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        // isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        'Edit Profil Gagal',
        'Pastikan Mengisi Format dengan benar',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  void checkEditProfil(
    String fullname,
    String addres,
    String phone,
  ) async {
    if (EditProfileFormKey.currentState!.validate()) {
      EditProfileFormKey.currentState!.save();
      try {
        await EditProfil(
          fullname,
          addres,
          phone,
        );
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    profileViewModel.FetchUserProfile();
    namalengkapCtrl =
        TextEditingController(text: profileViewModel.user.value.data.fullName);
    noHpCtrl =
        TextEditingController(text: profileViewModel.user.value.data.phone);
    alamatCtrl =
        TextEditingController(text: profileViewModel.user.value.data.address);
    update();
  }
}
