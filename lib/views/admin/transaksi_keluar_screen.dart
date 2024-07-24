import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/admin/transaksi_keluar_view_model.dart';

class TransaksiKeluarScreen extends GetView<TransaksiKeluarViewModel> {
  const TransaksiKeluarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiKeluarViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Obx(
            () {
              return SafeArea(
                child: Scaffold(
                  body: RefreshIndicator(
                    onRefresh: () => controller.loadTransaksiKeluar(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
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
                              itemCount: controller.transaksikeluar.length,
                              itemBuilder: (context, index) {
                                var data = controller.transaksikeluar[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    // height: 100.h,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Kode Transaksi',
                                              style: AppStyle(
                                                14.sp,
                                                Colors.black,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data.code,
                                              style: AppStyle(
                                                12.sp,
                                                primaryColor1,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                            Text(
                                              'Nama Penyetor',
                                              style: AppStyle(
                                                14.sp,
                                                Colors.black,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data.name,
                                              style: AppStyle(
                                                12.sp,
                                                primaryColor1,
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.is_approved == 0
                                                  ? 'Mengajukan Penarikan'
                                                  : 'Penarikan Disetujui',
                                              style: AppStyle(
                                                12.sp,
                                                data.is_approved == 0
                                                    ? Color.fromARGB(
                                                        255, 249, 3, 3)
                                                    : Color.fromARGB(
                                                        255, 3, 168, 18),
                                                FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data.amount.toString(),
                                              style: AppStyle(
                                                12.sp,
                                                primaryColor1,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                backgroundColor:
                                                    data.is_approved == 0
                                                        ? primaryColor1
                                                        : Colors.grey,
                                                fixedSize: Size.fromWidth(
                                                  140.w,
                                                ),
                                              ),
                                              onPressed: () {
                                                controller.approveDana(
                                                  data.id,
                                                );
                                                data.is_approved == 1;
                                              },
                                              child: Text(
                                                data.is_approved == 0
                                                    ? 'Setujui Penarikan'
                                                    : 'Pencairan telah disetujui',
                                                style: AppStyle(
                                                  10.sp,
                                                  Colors.white,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                ),
              );
            },
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
              'Data Transaksi Keluar',
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
