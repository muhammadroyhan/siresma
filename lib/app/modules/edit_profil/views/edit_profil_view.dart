import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/models/user.dart';

import '../../profil/controllers/profil_controller.dart';
import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final ProfilController ProfilCtrl = Get.put(ProfilController());

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Form(
            key: controller.editprofilFormKey,
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 25, right: 25),
              width: MediaQueryWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      reusableText(
                          'Edit Profil', Colors.black, 18, FontWeight.bold),
                    ],
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.05,
                  ),
                  Transform.scale(
                    scale: 2.5,
                    child: controller.ImageFile != null
                        ? CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            backgroundImage: FileImage(controller.ImageFile!),
                          )
                        : ("${ProfilCtrl.profil_picture.value}" != null)
                            ? CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                backgroundImage: NetworkImage(
                                    "${ProfilCtrl.profil_picture.value}"),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                child: Icon(
                                  FontAwesomeIcons.solidUser,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      controller.imagepicker();
                    },
                    child: reusableText(
                        'Edit Foto Profil', Colors.black, 14, FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.04,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Nama', Colors.black, 14, FontWeight.bold),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      CustomeTextFieldSetorSampah(
                        initialValue: '${ProfilCtrl.name.value}',
                        hint: 'Nama',
                        controller: controller.nameCtrl,
                        validator: (value) {
                          return controller.validateNamaLengkap(value);
                        },
                        onChanged: (value) {
                          return controller.nameCtrl.text = value;
                        },
                        obscureText: false,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.03,
                      ),
                      reusableText(
                          'No Handpone', Colors.black, 14, FontWeight.bold),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      CustomeTextFieldSetorSampah(
                        initialValue: '${ProfilCtrl.phone.value}',
                        hint: 'No Handpone',
                        controller: controller.phoneCtrl,
                        validator: (value) {
                          return controller.validateNomorHp(value);
                        },
                        onChanged: (value) {
                          return controller.phoneCtrl.text = value;
                        },
                        obscureText: false,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.03,
                      ),
                      reusableText('Alamat', Colors.black, 14, FontWeight.bold),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      CustomeTextFieldSetorSampah(
                          initialValue: '${ProfilCtrl.address.value}',
                          hint: 'Alamat',
                          controller: controller.addressCtrl,
                          validator: (value) {
                            return controller.validateAlamat(value);
                          },
                          onChanged: (value) {
                            return controller.addressCtrl.text = value;
                          },
                          obscureText: false,
                          enable: true),
                      SizedBox(
                        height: MediaQueryHeight * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: primary,
                              fixedSize: Size(MediaQueryWidth * 0.35,
                                  MediaQueryHeight * 0.025),
                            ),
                            onPressed: () {
                              if (controller.nameCtrl.text == "") {
                                controller.nameCtrl.text =
                                    ProfilCtrl.name.value;
                              }
                              if (controller.phoneCtrl.text == "") {
                                controller.phoneCtrl.text =
                                    ProfilCtrl.phone.value;
                              }
                              if (controller.addressCtrl.text == "") {
                                controller.addressCtrl.text =
                                    ProfilCtrl.address.value;
                              }
                              controller.checkUpdateprofile();
                            },
                            child: Text(
                              "SIMPAN",
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
