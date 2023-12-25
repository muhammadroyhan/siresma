import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import '../../../models/user.dart';
import '../../location/controllers/location_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final List<String> imgList = [
      'assets/image/IMG_4632.jpg',
      'assets/image/IMG-20230707-WA0004.jpg',
      'assets/image/img2.jpg',
      'assets/image/image 10.png',
    ];

    final ProfilController ProfilCtrl = Get.put(ProfilController());

    final LocationController LocationCtrl = Get.put(LocationController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        controller.update();
        return Scaffold(
          appBar: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 40, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.55,
                          child: "${ProfilCtrl.profil_picture.value}" != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: NetworkImage(
                                    "${ProfilCtrl.profil_picture.value}",
                                    scale: 1.0,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  child: Icon(FontAwesomeIcons.solidUser,
                                      color: Colors.grey.shade300),
                                ),
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.06,
                        ),
                        Text(
                          'SIRESMA',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    height: MediaQueryHeight * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "${controller.name.value}" == ''
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    '/location',
                                    arguments: LocationCtrl.fetchData(),
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: primary,
                                      ),
                                      SizedBox(
                                        width: MediaQueryWidth * 0.01,
                                      ),
                                      reusableText('Location', Colors.black, 20,
                                          FontWeight.bold),
                                    ],
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: primary,
                                  ),
                                  SizedBox(
                                    width: MediaQueryWidth * 0.01,
                                  ),
                                  reusableText("${controller.name.value}",
                                      Colors.black, 18, FontWeight.bold),
                                ],
                              ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/evoucher');
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/image/icon_evocher.png',
                                  scale: 2,
                                ),
                                SizedBox(
                                  width: MediaQueryWidth * 0.01,
                                ),
                                Text(
                                  'E-V',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(MediaQueryHeight * 0.18),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    clipBehavior: Clip.hardEdge,
                    autoPlay: true, // Set this to true for auto-advancing
                    // aspectRatio: 9/5,
                    viewportFraction: 1,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                              child: Image.asset(
                                item,
                                fit: BoxFit.fitWidth,
                                width: MediaQueryWidth,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: MediaQueryHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/image/pp_6-01 1.png',
                            scale: 1.3,
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Text(
                            'PPKO BEMFIK\nUDINUS',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQueryWidth * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQueryWidth * 0.65,
                            height: MediaQueryHeight * 0.13,
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: bg_text,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            child: Text(
                              'Implementasi Ekonomi Sirkular melalui\nPengembangan Rumah Sampah Digital\n4.0 Resik Mandiri di Kelurahan Sambiroto\nberbasis  sustainable zero waste\nManajemen',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var url = Uri.parse(
                                  'https://www.instagram.com/ppkormawa_bemfikudinus/');
                              await launchUrl(
                                url,
                                mode: LaunchMode.platformDefault,
                              );
                            },
                            child: Text(
                              'Cari Tahu',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              fixedSize: Size(
                                MediaQueryWidth * 0.3,
                                36,
                              ),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/MASKOT_SIRESMA.png',
                        scale: 1.75,
                      ),
                      SizedBox(
                        width: MediaQueryWidth * 0.13,
                      ),
                      Container(
                        height: MediaQueryHeight * 0.13,
                        width: MediaQueryWidth * 0.43,
                        color: Colors.amber,
                        child: Image.asset(
                          'assets/image/image 19.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
