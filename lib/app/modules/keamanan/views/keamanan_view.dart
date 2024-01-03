import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/keamanan/controllers/keamanan_controller.dart';
import '../../../common/button.dart';

class KeamananView extends GetView<KeamananController> {
  const KeamananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<KeamananController>(builder: (controller) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 45, left: 30, right: 30),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            child: Form(
              key: controller.GantiPasswordFormKey,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/image/icon_keamanan.png',
                          scale: 1.1,
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keamanan Akun',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQueryHeight * 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: primary,
                              ),
                              width: MediaQueryWidth * 0.2,
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.05,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Buat Password Baru Anda', Colors.black,
                            20, FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                        CustomeTextFieldSetorSampah(
                          hint: 'Masukkan Password Baru',
                          obscureText: true,
                          enable: true,
                          controller: controller.passwordBaruCtrl,
                          onChanged: (value) {
                            return controller.passwordBaruCtrl.text = value;
                          },
                          validator: (value) {
                            return controller.validatePasswordBaru(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.02,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Konfirmasi Password', Colors.black, 20,
                            FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                        CustomeTextFieldSetorSampah(
                          hint: 'Masukkan Kembali Password Baru',
                          obscureText: true,
                          enable: true,
                          controller: controller.konfirmPasswordCtrl,
                          onChanged: (value) {
                            return controller.konfirmPasswordCtrl.text = value;
                          },
                          validator: (value) {
                            return controller.validateKonfirmPassword(value);
                          },
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.03,
                        ),
                        Text(
                          '*Password harus terdiri dari 8 karakter, 1 huruf besar dan 1 huruf kecil',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 154, 153, 153)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: primary,
                      fixedSize: Size(
                          MediaQueryWidth * 0.40, MediaQueryHeight * 0.025),
                    ),
                    onPressed: () {
                      controller.checkPasswordBaru();
                    },
                    child: Text(
                      "Ganti Pasword",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
