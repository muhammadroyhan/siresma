import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/qradmin/controllers/qradmin_controller.dart';

import '../controllers/inputcode_controller.dart';

class InputCodeView extends GetView<InputCodeController> {
  InputCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<InputCodeController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.only(top: 45, left: 30, right: 30),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            child: Form(
              key: controller.qradminFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.weightScale,
                          size: 40,
                          color: primary,
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Input Code Berat',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        reusableText(
                            'Code Berat', Colors.black, 15, FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                      ],
                    ),
                  ),
                  CustomeTextFieldSetorSampah(
                    hint: 'Masukkan Code Berat',
                    obscureText: false,
                    enable: true,
                    controller: controller.CodeCtrl,
                    validator: (value) {
                      return controller.validateCode(value!);
                    },
                    onChanged: (value) {
                      return controller.CodeCtrl.text = value;
                    },
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
                      fixedSize: Size(
                          MediaQueryWidth * 0.35, MediaQueryHeight * 0.025),
                    ),
                    onPressed: () {
                      controller.checkIots();
                    },
                    child: Text(
                      "Kirim",
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
