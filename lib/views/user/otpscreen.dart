import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/otp_view_model.dart';

class OtpScreen extends GetView<OtpViewModel> {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpViewModel>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(
                  50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 230.w,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade400,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'asset/MASKOT_SIRESMA.png',
                        scale: 1.dm,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Text(
                      "Verifikasi",
                      style: AppStyle(
                        24.sp,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Masukkan Kode Verifikasi Anda",
                      style: AppStyle(16.sp, Colors.black, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    OTPTextField(
                      width: 250.w,
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
                      height: 24.h,
                    ),
                    Obx(() {
                      return TextButton(
                        onPressed: controller.countdownDuration.value == 0
                            ? () {
                                controller.startCountdownTimer();
                                controller.resendOTP();
                              }
                            : null,
                        child: Obx(
                          () => Text(
                            controller.countdownDuration.value == 0
                                ? "Kirim ulang kode OTP"
                                : "Kirim ulang kode OTP (${controller.countdownDuration.value})",
                            style: AppStyle(
                              16.sp,
                              controller.countdownDuration.value == 0
                                  ? Colors.blueAccent
                                  : Colors.grey,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 4.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: primaryColor1,
                        fixedSize: Size(
                          170.w,
                          50.h,
                        ),
                      ),
                      onPressed: () {
                        controller.otp(controller.otpCtrl.text);
                      },
                      child: Text(
                        "Verifikasi",
                        style: AppStyle(24.sp, Colors.white, FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
