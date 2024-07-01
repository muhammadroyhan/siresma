import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/view_models/user/register_view_model.dart';

class RegisterScreen extends GetView<RegisterViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;

    return GetBuilder<RegisterViewModel>(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  height: 735.h,
                  width: MediaQueryWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [primaryColor1, primaryColor2]),
                  ),
                  child: Form(
                    key: controller.registerFormKey,
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
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hint: "Nama Lengkap",
                          enable: true,
                          obscureText: false,
                          controller: controller.namalengkapCtrl,
                          validator: (value) {
                            return controller.validateNamaLengkap(value!);
                          },
                          onChanged: (value) {
                            return controller.namalengkapCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
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
                          height: 8.h,
                        ),
                        CustomTextFormFieldNumber(
                          hint: "Nomor Kartu Keluarga",
                          enable: true,
                          obscureText: false,
                          controller: controller.noKkCtrl,
                          validator: (value) {
                            return controller.validateNomorKK(value!);
                          },
                          onChanged: (value) {
                            return controller.noKkCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hint: "Alamat",
                          enable: true,
                          obscureText: false,
                          controller: controller.alamatCtrl,
                          validator: (value) {
                            return controller.validateAlamat(value!);
                          },
                          onChanged: (value) {
                            return controller.alamatCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormFieldNumber(
                          hint: "Nomor Handphone",
                          enable: true,
                          obscureText: false,
                          controller: controller.noHpCtrl,
                          validator: (value) {
                            return controller.validateNomorHp(value!);
                          },
                          onChanged: (value) {
                            return controller.noHpCtrl.text = value;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormFieldPassword(
                          hint: "Buat Password",
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
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.imagepicker();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromWidth(185.w),
                                ),
                                child: Text(
                                  'UPLOAD FOTO PROFIL',
                                  style: AppStyle(
                                      12.sp, primaryColor2, FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Transform.scale(
                                scale: 1.4.dm,
                                child: controller.profilePicture != null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.grey.shade400,
                                        backgroundImage: FileImage(
                                            controller.profilePicture!),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.grey.shade400,
                                        child: Image.asset(
                                          'asset/profile_placeholder.png',
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 210.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sudah punya akun?',
                                style: AppStyle(
                                    14.sp, Colors.white, FontWeight.normal),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/login');
                                },
                                child: Text(
                                  'Masuk',
                                  style: AppStyle(
                                      14.sp, Colors.white, FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.checkRegister(
                              controller.namalengkapCtrl.text,
                              controller.usernameCtrl.text,
                              controller.noKkCtrl.text,
                              controller.alamatCtrl.text,
                              controller.noHpCtrl.text,
                              controller.passwordCtrl.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(250.w),
                          ),
                          child: Text(
                            'Daftar',
                            style:
                                AppStyle(24.sp, primaryColor2, FontWeight.bold),
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
