import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import '../../../config/api.dart';

class QrAdminController extends GetxController {
  final GlobalKey<FormState> qradminFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController WeightCtrl = TextEditingController();

  String? validateWeight(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukkan Berat Sampah!!!';
    }
    {
      return null;
    }
  }

  void showSuccessAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 8,
              right: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'Scan QR Code',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                QrImageView(
                  data: message,
                  version: QrVersions.auto,
                  size: 220,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showErrorAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> Iots() async {
    try {
      var headers = {'Accept': 'application/json'};
      var url = Uri.parse(API.weight_iots);
      Map body = {
        "weight": WeightCtrl.text,
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        // var token = json['token'];
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('token', token);
        // print(token);
        final jsonData = json.decode(response.body);
        print(jsonData);
        showSuccessAlert(Get.overlayContext!, "${jsonData['message']}");

        //Tambahkan print response.body untuk melihat response dari server
      } else {
        showErrorAlert(Get.overlayContext!, "Input Berat Sampah Gagal");
      }
    } catch (e) {
      Get.back();
      showErrorAlert(
          Get.overlayContext!, "Input Berat Sampah Gagal: ${e.toString()}");
    }
  }

  void checkIots() async {
    if (qradminFromKey.currentState!.validate()) {
      qradminFromKey.currentState!.save();
      try {
        Iots();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
