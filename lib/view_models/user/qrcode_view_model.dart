import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api.dart';
import 'package:siresma/view_models/user/tabungansampah_view_model.dart';
import 'package:siresma/view_models/user/usernavbar_view_model.dart';

class QrcodeViewModel extends GetxController {
  Barcode? result;
  var data = "Scanning...".obs;
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool hasSentPostRequest = false;

  final UserNavbarViewModel userNavbarViewModel =
      Get.put(UserNavbarViewModel());
  final TabunganSampahViewModel tabunganSampahViewModel = Get.find();
  RxInt selectedId = RxInt(0);

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code != null &&
          data.value == "Scanning..." &&
          !hasSentPostRequest) {
        data.value = scanData.code!;
        hasSentPostRequest = true;
        controller.stopCamera();
        await ScanBarcode(scanData.code ?? "");
        controller.dispose();
      } else {
        data.value = "Scanning...";
      }
    });
  }

  Future<void> ScanBarcode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    selectedId.value = Get.arguments as int;
    final id = selectedId.value;
    try {
      final response = await https.post(
        Uri.parse(API.code_iots),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'garbage_savings_data_id': id.toString(),
          'code': code,
        },
      );
      var message = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        print(message);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Data IOT Berhasil",
          message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(
          const Duration(seconds: 1),
          () {
            tabunganSampahViewModel.FetchTabunganSampah();
            Get.back();
            // userNavbarViewModel.controllertab.jumpToTab(2);
          },
        );
        // hasSentPostRequest = false;
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Data IOT Gagal",
          message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        // hasSentPostRequest = false;
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Data IOT Gagal",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // hasSentPostRequest = false;
    }
  }
}
