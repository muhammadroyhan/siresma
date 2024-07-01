import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/view_models/admin/barcode_view_model.dart';

class BarcodeScreen extends GetView<BarcodeViewModel> {
  const BarcodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeViewModel>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Form(
              key: controller.BeratFormKey,
              child: Column(
                children: [
                  app_bar(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Berat Sampah  (/kg)',
                    style: AppStyle(
                      20.sp,
                      Colors.black,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFormFieldEditNumber(
                    hint: 'Masukkan berat sampah',
                    enable: true,
                    obscureText: false,
                    controller: controller.beratCtrl,
                    validator: (value) {
                      return controller.validateWeight(value!);
                    },
                    onChanged: (value) {
                      return controller.beratCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.checkIot(controller.beratCtrl.text);
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
      );
    });
  }

  Row app_bar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.weightScale,
          size: 42.sp,
          color: primaryColor1,
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Input Berat',
              style: AppStyle(
                22.sp,
                Colors.black,
                FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: primaryColor1,
              ),
              width: 80.w,
              height: 5.h,
            ),
          ],
        ),
      ],
    );
  }
}
