import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/button.dart';
import '../../../common/custom_textformfield.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<RegisterController>(builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            width: mediaQueryWidth,
            height: mediaQueryHeight * 1.075,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor1,
                  primaryColor2,
                ],
              ),
            ),
            child: Form(
              key: controller.registerFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/G_3.png',
                    scale: 2,
                  ),
                  Text(
                    'SIRESMA',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.015,
                  ),
                  CustomTextFields(
                    hint: 'Nama Lengkap',
                    obscureText: false,
                    enable: true,
                    controller: controller.NamaLengkapCtrl,
                    validator: (value) {
                      return controller.validateNamaLengkap(value!);
                    },
                    onChanged: (value) {
                      return controller.NamaLengkapCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  CustomTextFields(
                    hint: 'Username',
                    obscureText: false,
                    enable: true,
                    controller: controller.UsernameCtrl,
                    validator: (value) {
                      return controller.validateUsername(value!);
                    },
                    onChanged: (value) {
                      return controller.UsernameCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  CustomTextFields(
                    hint: 'Nomor Kartu Keluarga',
                    obscureText: false,
                    enable: true,
                    controller: controller.NomorkkCtrl,
                    validator: (value) {
                      return controller.validateNomorKK(value!);
                    },
                    onChanged: (value) {
                      return controller.NomorkkCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  CustomTextFields(
                    hint: 'Alamat',
                    obscureText: false,
                    enable: true,
                    controller: controller.AlamatCtrl,
                    validator: (value) {
                      return controller.validateAlamat(value!);
                    },
                    onChanged: (value) {
                      return controller.AlamatCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  CustomTextFields(
                    hint: 'Nomor Handphone',
                    obscureText: false,
                    enable: true,
                    controller: controller.NomorTlpnCtrl,
                    validator: (value) {
                      return controller.validateNomorHp(value!);
                    },
                    onChanged: (value) {
                      return controller.NomorTlpnCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  CustomTextFields(
                    hint: 'Buat Password',
                    obscureText: true,
                    enable: true,
                    controller: controller.PasswordCtrl,
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    onChanged: (value) {
                      return controller.PasswordCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      UploadpProfil(
                        text: 'UPLOAD FOTO PROFIL',
                        onPress: () {
                          controller.imagepicker();
                        },
                      ),
                      SizedBox(
                        width: mediaQueryHeight * 0.05,
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: controller.ImageFile != null
                            ? CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                backgroundImage:
                                    FileImage(controller.ImageFile!),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                child: Image.asset(
                                  'assets/image/profile_placeholder.png',
                                ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reusableText('Sudah punya Akun?', Colors.white, 14,
                          FontWeight.bold),
                      TextButton(
                        onPressed: () {
                          Get.offNamed('/login');
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonAuth(
                    text: 'REGISTER',
                    onPress: () {
                      controller.checkRegister();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
