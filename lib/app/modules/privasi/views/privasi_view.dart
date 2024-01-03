import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/keamanan/controllers/keamanan_controller.dart';

class PrivasiView extends GetView<KeamananController> {
  const PrivasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 45, left: 30, right: 30),
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/icon_privasi.png',
                      scale: 1.1,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ketentuan Privasi',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('SIRESMA ( Sistem ResiK Mandiri )',
                        Colors.black, 20, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Text(
                      'SIRESMA adalah aplikasi yang digunakan untuk mengelola data sampah yang telah dipilah. Aplikasi ini juga dapat digunakan untuk mengelola sampah secara mandiri dan dapat dijadikan sebagai sumber penghasilan tambahan melalui transaksi setor sampah dan tabungan. Pengguna dari aplikasi ini ditujukan kepada warga keluarahan sambiroto yaitu :',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.009,
                    ),
                    Text('- Warga RW 02 RT 08',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    Text('- Warga RW 05 RT 05 dan RT 06',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.003,
                    ),
                    Text(
                        'Pihak masyarakat Yang menggunakan aplikasi ini diharapkan untuk mematuhi ketentuan yang berlaku. Ketentuan yang berlaku adalah sebagai berikut :',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.007,
                    ),
                    Text(
                        '1. Mendaftarkan diri dengan data yang benar dan valid',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Text(
                        '2. Menjaga kerahasiaan data pribadi yang telah didaftarkan',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Text(
                        '3. Melakukan inputan setor dan transaksi dengan benar dan valid',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Text(
                        '4. Memperhatikan jadwal setor sampah yang telah ditentukan oleh pihak bank sampah setempat',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Text('',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify),
                    SizedBox(
                      height: MediaQueryHeight * 0.009,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: primary,
                  fixedSize:
                      Size(MediaQueryWidth * 0.05, MediaQueryHeight * 0.05),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
