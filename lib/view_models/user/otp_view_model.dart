import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api.dart';
import 'package:siresma/config/auth_service.dart';

class OtpViewModel extends GetxController {
  TextEditingController otpCtrl = TextEditingController();
  var isLoading = false.obs;
  final AuthService authService = AuthService();

  Future<void> otp(String otp_code) async {
    isLoading(true);
    try {
      final response = await authService.otp(otp_code);
      if (response!.success) {
        print(response.message);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Verifikasi Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(const Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Verifikasi Gagal",
          response.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Verifikasi Gagal",
        "Masukkan kode otp dengan benar",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> resendOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("user_id");
    print(userId);
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var body = {
        'user_id': jsonEncode(userId),
      };
      var url = Uri.parse(API.create_otp);
      var response = await https.post(
        url,
        headers: headers,
        body: body,
      );
      var succes = jsonDecode(response.body)['message'];
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print(responseBody);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Verifikasi Berhasil",
          succes,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Verifikasi Gagal",
          error,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Verifikasi Gagal",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  RxInt countdownDuration = 120.obs;
  RxBool isTimerRunning = false.obs;
  Timer? countdownTimer;

  void startCountdownTimer() {
    if (!isTimerRunning.value) {
      countdownDuration.value =
          120; // Reset countdown duration to initial value
      countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (countdownDuration.value > 0) {
          countdownDuration.value--;
        } else {
          timer.cancel();
          isTimerRunning.value = false;
        }
      });
      isTimerRunning.value = true;
    }
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    startCountdownTimer();
    super.onInit();
  }
}
