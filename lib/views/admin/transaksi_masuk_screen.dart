import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/admin/transaksi_masuk_view_model.dart';

class TransaksiMasukScreen extends GetView<TransaksiMasukViewModel> {
  const TransaksiMasukScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiMasukViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Mengurutkan daftar transaksi dari yang terbaru ke yang terlama
          controller.transaksimasuk
              .sort((a, b) => b.store_date.compareTo(a.store_date));
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      app_bar(),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.transaksimasuk.length,
                        itemBuilder: (context, index) {
                          var data = controller.transaksimasuk[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 6,
                                    blurRadius: 5,
                                    offset: Offset.fromDirection(1, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'No Transaksi',
                                        style: AppStyle(
                                          14.sp,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data.code,
                                        style: AppStyle(
                                          13.sp,
                                          primaryColor1,
                                          FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        'Nama Penyetor',
                                        style: AppStyle(
                                          14.sp,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data.name,
                                        style: AppStyle(
                                          13.sp,
                                          primaryColor1,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Kredit',
                                        style: AppStyle(
                                          14.sp,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data.amount.toString(),
                                        style: AppStyle(
                                          13.sp,
                                          primaryColor1,
                                          FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        'Tanggal Setor',
                                        style: AppStyle(
                                          14.sp,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        data.store_date,
                                        style: AppStyle(
                                          13.sp,
                                          primaryColor1,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Row app_bar() {
    return Row(
      children: [
        Image.asset(
          'asset/icon_tabungan.png',
          scale: 1.4.dm,
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Transaksi Masuk',
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
