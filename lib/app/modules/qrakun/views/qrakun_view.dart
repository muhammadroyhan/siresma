import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/qrakun_controller.dart';

class QrAkunView extends GetView<QrAkunController> {
  const QrAkunView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: GetBuilder<QrAkunController>(
      builder: (controller) {
        return Container(
          height: MediaQueryHeight,
          width: MediaQueryWidth,
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reusableText(
                "Coming Soon",
                const Color.fromARGB(255, 121, 121, 121),
                20,
                FontWeight.bold,
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: primary,
                  fixedSize:
                      Size(MediaQueryWidth * 0.05, MediaQueryHeight * 0.05),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_sharp),
              ),
            ],
          ),
        );
      },
    ));
  }
}
