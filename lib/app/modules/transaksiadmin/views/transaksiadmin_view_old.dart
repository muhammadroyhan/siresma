import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import '../controllers/transaksiadmin_controller.dart';
import 'package:siresma/app/models/user.dart';

class TransaksiadminViewOld extends GetView<TransaksiadminController> {
  const TransaksiadminViewOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double MediaQueryWidth = MediaQuery.of(context).size.width;
    final double MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 45, left: 20, right: 20),
        width: MediaQueryWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/image/icon_tabungan.png',
                  scale: 1.6,
                ),
                SizedBox(
                  width: MediaQueryWidth * 0.04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Transaksi',
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
            SizedBox(
              height: MediaQueryHeight * 0.03,
            ),
            Obx(() {
              final controller = Get.find<TransaksiadminController>();
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    Container(
                      width: MediaQueryWidth,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 6,
                              blurRadius: 5,
                              offset: Offset.fromDirection(1, 6))
                        ],
                      ),
                      child: reusableText(
                        "",
                        Colors.white,
                        18,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.02,
                    ),
                    Container(
                      width: MediaQueryWidth,
                      height: MediaQueryHeight * 0.13,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 6,
                              blurRadius: 5,
                              offset: Offset.fromDirection(1, 6))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reusableText(
                                "Total Pendapatan",
                                Colors.black,
                                13,
                                FontWeight.bold,
                              ),
                              reusableText(
                                "Rp. ${controller.total_income.value}",
                                Colors.black,
                                14,
                                FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reusableText(
                                "Total Saldo Nasabah",
                                Colors.black,
                                13,
                                FontWeight.bold,
                              ),
                              reusableText(
                                "Rp. ${controller.user_income.value}",
                                Colors.black,
                                14,
                                FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reusableText(
                                "Total Saldo Pengelola",
                                Colors.black,
                                13,
                                FontWeight.bold,
                              ),
                              reusableText(
                                "Rp. ${controller.admin_income.value}",
                                Colors.black,
                                14,
                                FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    ));
  }
}
