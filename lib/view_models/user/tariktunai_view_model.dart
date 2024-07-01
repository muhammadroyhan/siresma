import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api_service.dart';

class TariktunaiViewModel extends GetxController {
  final GlobalKey<FormState> tariksaldoFormKey = GlobalKey<FormState>();
  TextEditingController TarikSaldoCtrl = TextEditingController();

  String? validateTarikSaldo(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Masukan jumlah saldo yang ingin ditarik';
    }
    {
      return null;
    }
  }

  var isLoading = false.obs;
  final ApiService apiService = ApiService();

  Future<void> tariktunai(String tariksaldo) async {
    isLoading(true);
    try {
      final response = await apiService.postTarikSaldo(tariksaldo);
      if (response != null && response.success) {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Tarik Tunai Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(
          const Duration(seconds: 2),
          () {
            Get.back();
          },
        );
        isLoading(true);
      } else {
        isLoading(false);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Tarik Tunai Gagal",
          response!.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Tarik Tunai Gagal",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading(false);
    }
  }

  void checkTariksaldo(String tariksaldo) async {
    if (tariksaldoFormKey.currentState != null &&
        tariksaldoFormKey.currentState!.validate()) {
      tariksaldoFormKey.currentState!.save();
      try {
        await tariktunai(tariksaldo);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
