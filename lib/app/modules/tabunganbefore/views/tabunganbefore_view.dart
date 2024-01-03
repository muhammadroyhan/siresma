import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import '../controllers/tabunganefore_controller.dart';

class TabunganbeforeView extends GetView<TabController> {
  const TabunganbeforeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 45, left: 20, right: 20),
          width: MediaQueryWidth,
          child: Column(
            children: [
              Container(
                width: MediaQueryWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/icon_tabungan.png',
                      scale: 1.6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tabungan Sampah',
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/transaksi');
                      },
                      child: Icon(
                        FontAwesomeIcons.fileLines,
                        size: 36,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              Obx(() {
                final controller = Get.find<TabunganbeforeController>();
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saldo Anda :',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: MediaQueryHeight * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rp. ',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '${controller.user_balance.value}',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/image/icon_saldo.png',
                              scale: 1.2,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.trashData.length,
                        itemBuilder: (context, index) {
                          final data = controller.trashData[index];
                          return Container(
                            padding: EdgeInsets.only(
                              bottom: 20,
                            ),
                            height: MediaQueryHeight * 0.21,
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: 20, left: 20, top: 20, bottom: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  reusableText(
                                    'Sampah ${data.trashCategory}',
                                    Colors.black,
                                    17,
                                    FontWeight.bold,
                                  ),
                                  reusableText(
                                    '${data.storeDate}',
                                    hints_text_setor,
                                    15,
                                    FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: MediaQueryHeight * 0.023,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      reusableText(
                                          "${data.status}",
                                          Colors.lightGreen,
                                          15,
                                          FontWeight.bold),
                                      "${data.status}" == 'Masih dalam Proses'
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                backgroundColor: primary,
                                                fixedSize: Size(
                                                    MediaQueryWidth * 0.35,
                                                    MediaQueryHeight * 0.020),
                                              ),
                                              onPressed: () {
                                                final selectedId = data
                                                    .id; // Ambil id dari objek TrashData
                                                Get.toNamed('/qrcode',
                                                    arguments: selectedId);
                                              },
                                              child: const Text(
                                                "Scan QR",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                reusableText(
                                                    'Berat : ${data.iot?.weight} Kg',
                                                    Colors.black,
                                                    17,
                                                    FontWeight.bold),
                                                SizedBox(
                                                    height: MediaQueryHeight *
                                                        0.01),
                                                reusableText(
                                                    'Pendapatan : Rp ${data.userBalance}',
                                                    Colors.black,
                                                    12,
                                                    FontWeight.bold),
                                              ],
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
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
