import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/view_models/user/login_view_model.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [primaryColor1, primaryColor2]),
                  ),
                  child: Form(
                    key: controller.LoginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/Logo.png',
                          scale: 1.2.dm,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(
                          child: Text(
                            'SIRESMA',
                            style:
                                AppStyle(30.sp, Colors.white, FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Sistem Resik Mandiri',
                            style:
                                AppStyle(16.sp, Colors.white, FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                          hint: "Username",
                          enable: true,
                          obscureText: false,
                          controller: controller.usernameCtrl,
                          validator: (value) {
                            return controller.validateUsername(value!);
                          },
                          onChanged: (value) {
                            return controller.usernameCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormFieldPassword(
                          hint: "Password",
                          enable: true,
                          obscureText: true,
                          controller: controller.passwordCtrl,
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          onChanged: (value) {
                            return controller.passwordCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Belum punya akun?',
                                style: AppStyle(
                                    14.sp, Colors.white, FontWeight.normal),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAllNamed('/register');
                                },
                                child: Text(
                                  'Daftar',
                                  style: AppStyle(
                                      14.sp, Colors.white, FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.checkLogin(
                              controller.usernameCtrl.text,
                              controller.passwordCtrl.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(250.w),
                          ),
                          child: Text(
                            'Masuk',
                            style:
                                AppStyle(24.sp, primaryColor2, FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 450.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'asset/MASKOT_SIRESMA.png',
                                scale: 1.2.dm,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
