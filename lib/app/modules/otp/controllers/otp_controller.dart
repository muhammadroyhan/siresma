import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';

class OtpController extends GetxController {
  TextEditingController otpCtrl = TextEditingController();

  Future<void> postOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("id");
    String otp_code = otpCtrl.text;
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var body = {
        'user_id': userId,
        'otp_code': otp_code,
      };
      var url = Uri.parse(API.otp); // Replace with your POST API URL
      var response = await https.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      var succes = jsonDecode(response.body)['message'];

      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        customAllertDialog("Succes", "${succes}", "succes");
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        customAllertDialog("Verifikasi Gagal", '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Verifikasi Gagal", e.toString(), 'error');
    }
  }

  Future<void> resendOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("id");
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
        customAllertDialog("Sukses", '${succes}', 'succes');
      } else {
        customAllertDialog("Gagal", '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Gagal", e.toString(), 'error');
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

  @override
  void onReady() {
    super.onReady();
  }
}
