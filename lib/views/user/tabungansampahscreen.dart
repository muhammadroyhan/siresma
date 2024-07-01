import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/tabungansampah_view_model.dart';

class TabunganSampahScreen extends GetView<TabunganSampahViewModel> {
  const TabunganSampahScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabunganSampahViewModel>(
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
                    onRefresh: () => controller.loadTabunganSampah(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            app_bar(),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: primaryColor1,
                                borderRadius: const BorderRadius.all(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Saldo Anda :',
                                        style: AppStyle(
                                          18.sp,
                                          Colors.white,
                                          FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rp. ',
                                            style: AppStyle(
                                              18.sp,
                                              Colors.white,
                                              FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            '${controller.tabungan.value.data.userBalance}',
                                            style: AppStyle(
                                              18.sp,
                                              Colors.white,
                                              FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'asset/icon_saldo.png',
                                    scale: 1.2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            listview_tabungan(controller),
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

  ListView listview_tabungan(TabunganSampahViewModel controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.tabungan.value.data.trashStoreLogs.length,
      itemBuilder: (context, index) {
        var data = controller.tabungan.value.data.trashStoreLogs[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sampah ${data.trashCategory}',
                  style: AppStyle(
                    16.sp,
                    Colors.black,
                    FontWeight.bold,
                  ),
                ),
                Text(
                  data.storeDate,
                  style: AppStyle(
                    16.sp,
                    Colors.black,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.status,
                      style: AppStyle(
                        16.sp,
                        Colors.lightGreen,
                        FontWeight.bold,
                      ),
                    ),
                    if (data.status == 'Masih dalam Proses')
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: primaryColor1,
                          fixedSize: Size.fromWidth(
                            120.w,
                          ),
                        ),
                        onPressed: () {
                          final selectedId = data.id;
                          Get.toNamed(
                            '/qrcode',
                            arguments: selectedId,
                          );
                        },
                        child: Text(
                          "Scan QR",
                          style: AppStyle(
                            16.sp,
                            Colors.white,
                            FontWeight.normal,
                          ),
                        ),
                      )
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'Berat : ${data.iot!.weight} Kg',
                            'Berat : ${data.iot!.weight} Kg',
                            style: AppStyle(
                              17.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Pendapatan : Rp ${data.userBalance}',
                            style: AppStyle(
                              12.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row app_bar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'asset/icon_tabungan.png',
          scale: 1.4.dm,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tabungan Sampah',
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
        GestureDetector(
          onTap: () {
            Get.toNamed('/transaksi');
          },
          child: Icon(
            FontAwesomeIcons.fileLines,
            size: 36.sp,
            color: primaryColor1,
          ),
        ),
      ],
    );
  }
}
