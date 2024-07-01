import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/view_models/user/tariktunai_view_model.dart';

class Tariktunaiscreen extends GetView<TariktunaiViewModel> {
  const Tariktunaiscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TariktunaiViewModel>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: controller.tariksaldoFormKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'asset/icon_tabungan.png',
                        scale: 1.4.dm,
                        filterQuality: FilterQuality.high,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transaksi Sampah',
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
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Tarik Saldo (RP)',
                    style: AppStyle(
                      16.sp,
                      Colors.black,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFormFieldEditNumber(
                    hint: 'Masukkan Jumlah Nominal',
                    enable: true,
                    obscureText: false,
                    controller: controller.TarikSaldoCtrl,
                    validator: (value) {
                      return controller.validateTarikSaldo(value!);
                    },
                    onChanged: (value) {
                      return controller.TarikSaldoCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.checkTariksaldo(
                          controller.TarikSaldoCtrl.text,
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
                        'Tarik Saldo',
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
}
