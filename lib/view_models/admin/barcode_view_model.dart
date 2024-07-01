import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/config/api_admin_service.dart';

class BarcodeViewModel extends GetxController {
  final GlobalKey<FormState> BeratFormKey = GlobalKey<FormState>();
  TextEditingController beratCtrl = TextEditingController();
  String? validateWeight(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Masukkan Berat Sampah!!!';
    }
    {
      return null;
    }
  }

  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();

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
                    child: Text('Scan QR Code',
                        style: AppStyle(20.sp, Colors.black, FontWeight.bold)),
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
                      child: Text(
                        'Tutup',
                        style: AppStyle(14.sp, Colors.black, FontWeight.normal),
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

  Future<void> postBerat(String weight) async {
    try {
      isLoading(true); 
      final response = await apiAdminService.postWeight(weight);
      if (response!.success) {
        print(response.message);
        showSuccessAlert(Get.overlayContext!, response.message);
      } else {
        showErrorAlert(Get.overlayContext!, response.message);
      }
    } catch (e) {
      showErrorAlert(
        Get.overlayContext!,
        e.toString(),
      );
    }
  }

  void checkIot(String weight) async {
    if (BeratFormKey.currentState != null &&
        BeratFormKey.currentState!.validate()) {
      BeratFormKey.currentState!.save();
      try {
        await postBerat(weight);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
