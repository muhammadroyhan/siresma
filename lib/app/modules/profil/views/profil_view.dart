import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siresma/app/modules/login/controllers/login_controller.dart';

import '../../../common/button.dart';
import '../../../common/custom_textformfield.dart';
import '../../../models/user.dart';
import '../controllers/profil_controller.dart';
import 'package:flutter/material.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final LoginController LoginCtrl = Get.put(LoginController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          appBar: PreferredSize(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  '/edit-profil',
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQueryHeight * 0.195,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.55,
                            child: "${controller.profil_picture.value}" != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    backgroundImage: NetworkImage(
                                      "${controller.profil_picture.value}",
                                      scale: 1.0,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    child: Icon(FontAwesomeIcons.solidUser,
                                        color: Colors.grey.shade300),
                                  ),
                          ),
                          SizedBox(
                            width: MediaQueryWidth * 0.07,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText('${controller.name.value}',
                                  Colors.black, 17, FontWeight.bold),
                              SizedBox(
                                height: MediaQueryHeight * 0.004,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.mobile,
                                    size: 13,
                                    color: primary,
                                  ),
                                  SizedBox(
                                    width: MediaQueryWidth * 0.02,
                                  ),
                                  reusableText('${controller.phone.value}',
                                      Colors.black, 13, FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: MediaQueryHeight * 0.002,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.solidAddressCard,
                                    size: 13,
                                    color: primary,
                                  ),
                                  SizedBox(
                                    width: MediaQueryWidth * 0.02,
                                  ),
                                  reusableText('${controller.no_kk.value}',
                                      Colors.black, 13, FontWeight.normal),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(MediaQueryHeight * 0.17),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQueryWidth,
              height: MediaQueryHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText(
                          "Akun",
                          Colors.black,
                          17,
                          FontWeight.bold,
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
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/transaksi');
                    },
                    leading: Icon(
                      FontAwesomeIcons.fileLines,
                      color: primary,
                      size: 32,
                    ),
                    title: reusableText(
                        'Transaksi', Colors.black, 16, FontWeight.bold),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/evoucher');
                    },
                    leading: Icon(
                      FontAwesomeIcons.percent,
                      size: 32,
                      color: primary,
                    ),
                    title: reusableText(
                        'E-Voucher', Colors.black, 16, FontWeight.bold),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/qrakun');
                    },
                    leading: Icon(
                      FontAwesomeIcons.qrcode,
                      color: primary,
                      size: 32,
                    ),
                    title: reusableText(
                        'QR code Akun', Colors.black, 16, FontWeight.bold),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/keamanan');
                    },
                    leading: Icon(
                      FontAwesomeIcons.shieldHalved,
                      color: primary,
                      size: 32,
                    ),
                    title: reusableText(
                        'Keamanan Akun', Colors.black, 16, FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Lainnya',
                          style: GoogleFonts.inter(
                            fontSize: 17,
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
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/privasi');
                    },
                    leading: Icon(
                      FontAwesomeIcons.lock,
                      color: primary,
                      size: 32,
                    ),
                    title: reusableText(
                        'Ketentuan Privasi', Colors.black, 16, FontWeight.bold),
                  ),
                  ListTile(
                    onTap: () {
                      LoginCtrl.Logout();
                    },
                    leading: Icon(
                      FontAwesomeIcons.rightFromBracket,
                      color: primary,
                      size: 32,
                    ),
                    title: reusableText(
                        'Logout', Colors.black, 17, FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
