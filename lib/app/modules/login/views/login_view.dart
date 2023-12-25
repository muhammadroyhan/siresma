import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    bool isAgree = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(builder: (controller) {
          return Container(
            width: mediaQueryWidth,
            height: mediaQueryHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/image/background.png'), // Ubah sesuai nama gambar latar belakang
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Form(
                key: controller.loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/ic_photo.png',
                      scale: 0.8,
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.005,
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.03,
                    ),
                    CustomTextFields(
                      hint: 'Name', // Ubah dari 'Username' menjadi 'Name'
                      obscureText: false,
                      enable: true,
                      controller: controller.usernameCtrl,
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                      onChanged: (value) {
                        return controller.usernameCtrl.text = value;
                      },
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.015,
                    ),
                    CustomTextFields(
                      hint: 'Palindrome', // Ubah dari 'Password' menjadi 'Palindrome'
                      obscureText: true,
                      enable: true,
                      controller: controller.passwordCtrl,
                      validator: (value) {
                        return controller.validatePalindrome(value!);
                      },
                      onChanged: (value) {
                        return controller.passwordCtrl.text = value;
                      },
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.03,
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.checkPalindrome();
                      },
                      child: Text('CHECK'), // Ubah dari 'LOG IN' menjadi 'CHECK'
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(43, 99, 123, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/home');
                      },
                      child: Text('NEXT'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(43, 99, 123, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
