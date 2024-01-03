import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/transaksimasuk.dart';
import 'package:siresma/app/modules/transaksimasuk/controllers/transaksimasuk_controller.dart';

class TransaksiMasukView extends GetView<TransaksiMasukController> {
  const TransaksiMasukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.loadTransaksi(),
        child: SingleChildScrollView(
          child: Obx(
            () {
              // Mengurutkan daftar transaksi dari yang terbaru ke yang terlama
              controller.transaksi
                  .sort((a, b) => b['store_date'].compareTo(a['store_date']));

              return Container(
                padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                width: MediaQueryWidth,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/image/icon_nasabah.png',
                            scale: 0.9,
                          ),
                          SizedBox(
                            width: MediaQueryWidth * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data Transaksi ',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Masuk',
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.transaksi.length,
                      itemBuilder: (context, index) {
                        var trs = controller.transaksi[index];
                        return Container(
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          width: MediaQueryWidth,
                          height: MediaQueryHeight * 0.22,
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 20, left: 20, top: 20, bottom: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No Transaksi',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    reusableText(
                                        trs['code'],
                                        Color.fromARGB(255, 39, 178, 83),
                                        13,
                                        FontWeight.bold),
                                    SizedBox(
                                      height: MediaQueryHeight * 0.04,
                                    ),
                                    Text(
                                      'Nama Penyetor',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      trs['name'],
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Kredit',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    reusableText(
                                        trs['amount'].toString(),
                                        Color.fromARGB(255, 39, 178, 83),
                                        13,
                                        FontWeight.bold),
                                    SizedBox(
                                      height: MediaQueryHeight * 0.04,
                                    ),
                                    Text(
                                      'Tanggal Setor',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      trs['store_date'],
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
