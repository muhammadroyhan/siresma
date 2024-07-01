import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/view_models/user/editprofile_view_model.dart';

class Editprofilescreen extends GetView<EditprofileViewModel> {
  const Editprofilescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final MediaQueryWidth = MediaQuery.of(context).size.width;
    // final MediaQueryHeight = MediaQuery.of(context).size.height;

    return GetBuilder<EditprofileViewModel>(builder: (controller) {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Form(
                  key: controller.EditProfileFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Edit Profil',
                          style: AppStyle(
                            18.sp,
                            Colors.black,
                            FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: Transform.scale(
                          scale: 2.5.dm,
                          child: controller.profilePicture != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage:
                                      FileImage(controller.profilePicture!),
                                )
                              : (controller.profileViewModel.user.value.data
                                          .profilePicture !=
                                      false)
                                  ? CircleAvatar(
                                      backgroundColor: Colors.grey.shade400,
                                      backgroundImage: NetworkImage(controller
                                          .profileViewModel
                                          .user
                                          .value
                                          .data
                                          .profilePicture),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.grey.shade400,
                                      child: Icon(
                                        FontAwesomeIcons.solidUser,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            controller.imagepicker();
                          },
                          child: Text(
                            'Ubah Foto Profile',
                            style: AppStyle(
                              16.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        'Nama',
                        style: AppStyle(
                          16.sp,
                          Colors.black,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormFieldEdit(
                        hint: 'Nama Lengkap',
                        enable: true,
                        obscureText: false,
                        controller: controller.namalengkapCtrl,
                        validator: (value) {
                          return controller.validateNamaLengkap(value);
                        },
                        onChanged: (value) {
                          return controller.namalengkapCtrl.text = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'No Handphone',
                        style: AppStyle(
                          16.sp,
                          Colors.black,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormFieldEditNumber(
                        hint: 'No Handphone',
                        enable: true,
                        obscureText: false,
                        controller: controller.noHpCtrl,
                        validator: (value) {
                          return controller.validateNomorHp(value);
                        },
                        onChanged: (value) {
                          return controller.noHpCtrl.text = value;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Alamat',
                        style: AppStyle(
                          16.sp,
                          Colors.black,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormFieldEdit(
                        hint: 'Alamat',
                        enable: true,
                        obscureText: false,
                        controller: controller.alamatCtrl,
                        validator: (value) {
                          return controller.validateAlamat(value);
                        },
                        onChanged: (value) {
                          return controller.alamatCtrl.text = value;
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.checkEditProfil(
                              controller.namalengkapCtrl.text,
                              controller.alamatCtrl.text,
                              controller.noHpCtrl.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              160.w,
                              40.h,
                            ),
                            backgroundColor: primaryColor1,
                          ),
                          child: Text(
                            'Simpan',
                            style: AppStyle(
                              20.sp,
                              Colors.white,
                              FontWeight.bold,
                            ),
                          ),
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
    });
  }
}
