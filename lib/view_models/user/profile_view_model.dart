import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/config/auth_service.dart';
import 'package:siresma/models/user.dart';

class ProfileViewModel extends GetxController {
  var isLoading = false.obs;
  final AuthService authService = AuthService();
  final ApiService apiService = ApiService();
  Rx<UserModel> user = UserModel(
    success: false,
    message: '',
    data: UserData(
      id: 0,
      fullName: '',
      role: '',
      phone: '',
      address: '',
      location: '',
      noKk: '',
      profilePicture: '',
    ),
  ).obs;

  Future<void> loadUserPorfile() async {
    await FetchUserProfile();
    update();
  }

  Future<void> FetchUserProfile() async {
    try {
      isLoading(true);
      user.value = await apiService.getUserProfile();
      update();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    isLoading(true);
    try {
      Map<String, dynamic> response = await authService.logout();
      bool success = response['success'];
      String message = response['message'];

      if (success) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Keluar Berhasil",
          '$message',
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(
          const Duration(seconds: 2),
          () {
            Get.offAllNamed('/login');
          },
        );
        isLoading.value = true;
      } else {
        isLoading.value = false;
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Keluar Gagal",
          '$message',
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Keluar Gagal",
        e.toString(),
        backgroundColor: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    loadUserPorfile();
    super.onInit();
  }
}
