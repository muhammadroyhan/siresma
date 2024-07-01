import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api_admin_service.dart';
import 'package:siresma/config/auth_service.dart';
import 'package:siresma/models/datanasabah.dart';

class NasabahViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();
  final AuthService authService = AuthService();
  var datanasabah = <DataNasabah>[].obs;

  Future<void> loadDataNasabah() async {
    await FetchDataNasabah();
    update();
  }

  Future<void> FetchDataNasabah() async {
    try {
      isLoading(true);
      var dataNasabahResponse = await apiAdminService.getDataNasabah();
      if (dataNasabahResponse.success) {
        datanasabah.assignAll(dataNasabahResponse.data);
      } else {
        print(dataNasabahResponse.message);
      }
      update();
    } catch (e) {
      print(e.toString());
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
    super.onInit();
    loadDataNasabah();
  }
}
