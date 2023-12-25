import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/colors.dart';
import '../../../common/custom_textformfield.dart';
import '../controllers/tarik_saldo_controller.dart';

class TarikSaldoView extends GetView<TarikSaldoController> {
  const TarikSaldoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<TarikSaldoController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.only(top: 45, left: 30, right: 30),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            child: Form(
              key: controller.TarikSaldoFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/image/icon_tabungan.png',
                          scale: 1.5,
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tarik Saldo',
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
                    height: MediaQueryHeight * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(
                        'Tarik Saldo',
                        Colors.black,
                        15,
                        FontWeight.bold,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.015,
                      ),
                      CustomeAdminInputBerat(
                        hint: 'Masukkan Jumlah Nominal',
                        obscureText: false,
                        enable: true,
                        controller: controller.TarikSaldoCtrl,
                        validator: (value) {
                          return controller.validateTarikSaldo(value!);
                        },
                        onChanged: (value) {
                          return controller.TarikSaldoCtrl.text = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.02,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: primary,
                      fixedSize: Size.fromHeight(10),
                    ),
                    onPressed: () {
                      controller.checkTransaksi();
                    },
                    child: Text(
                      "Tarik Saldo",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
