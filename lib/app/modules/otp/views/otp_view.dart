import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';

import '../../../common/button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<OtpController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.only(
              top: 50,
              left: 50,
              right: 50,
            ),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: MediaQueryHeight * 0.55,
                  height: MediaQueryWidth * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/image/MASKOT_SIRESMA.png',
                    width: 240,
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.02,
                ),
                Text(
                  "Verification",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.007,
                ),
                Text(
                  "Masukkan Kode Verifikasi Anda",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.07,
                ),
                OTPTextField(
                  width: MediaQueryWidth,
                  length: 6,
                  obscureText: true,
                  outlineBorderRadius: 10,
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.otpCtrl.text = value;
                  },
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.05,
                ),
                TextButton(
                  onPressed: controller.countdownDuration.value == 0
                      ? () {
                          controller.startCountdownTimer();
                          controller.resendOTP();
                        }
                      : null,
                  child: Obx(
                    () => reusableText(
                      controller.countdownDuration.value == 0
                          ? "Kirim ulang kode OTP"
                          : "Kirim ulang kode OTP (${controller.countdownDuration.value})",
                      controller.countdownDuration.value == 0
                          ? Colors.blueAccent
                          : Colors.grey,
                      14,
                      FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.01,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: primary,
                    fixedSize:
                        Size(MediaQueryWidth * 0.4, MediaQueryHeight * 0.03),
                  ),
                  onPressed: () {
                    controller.postOTP();
                  },
                  child: Text(
                    "Verifikasi",
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
