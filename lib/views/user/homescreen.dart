import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final MediaQueryWidth = MediaQuery.of(context).size.width;

    final List<String> imgList = [
      'asset/IMG_4632.jpg',
      'asset/IMG-20230707-WA0004.jpg',
      'asset/img2.jpg',
      'asset/image 10.png',
    ];

    return GetBuilder<HomeViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Obx(() {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () => controller.loadFetchHome(),
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(150.h),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [headerColor1, headerColor2],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'asset/Logo.png',
                                  scale: 1.5.dm,
                                  filterQuality: FilterQuality.high,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(
                                  'SIRESMA',
                                  style: AppStyle(
                                      30.sp, Colors.white, FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40.h,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "${controller.home.value.data.name}" != ''
                                    ? Text(
                                        '${controller.home.value.data.name}',
                                        style: AppStyle(20.sp, Colors.black,
                                            FontWeight.bold),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Get.toNamed('/location');
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.locationDot,
                                              size: 24.sp,
                                              color: primaryColor1,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              'Lokasi',
                                              style: AppStyle(
                                                  20.sp,
                                                  Colors.black,
                                                  FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/evoucher');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'asset/icon_evocher.png',
                                        scale: 1.5.dm,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        'E-V',
                                        style: AppStyle(20.sp, Colors.black,
                                            FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            clipBehavior: Clip.hardEdge,
                            autoPlay:
                                true, // Set this to true for auto-advancing
                            // aspectRatio: 9/5,
                            viewportFraction: 1,
                          ),
                          items: imgList
                              .map((item) => Container(
                                    child: Center(
                                      child: Image.asset(
                                        item,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.fitWidth,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'asset/pp_6-01 1.png',
                                    scale: 1.dm,
                                    filterQuality: FilterQuality.high,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'PPKO BEMFIK\nUDINUS',
                                    textAlign: TextAlign.center,
                                    style: AppStyle(
                                        14.sp, Colors.black, FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: backgorundwidget,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.black38.withOpacity(0.5),
                                          blurRadius: 3,
                                          offset: Offset.zero,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Implementasi Ekonomi Sirkular melalui Pengembangan Rumah Sampah Digital 4.0 Resik Mandiri di Kelurahan Sambiroto berbasis  sustainable zero waste Manajemen',
                                      style: AppStyle(
                                          12.sp, Colors.black, FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
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
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor1,
                                      fixedSize: Size(
                                        125.w,
                                        20.h,
                                      ),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                    child: Text(
                                      'Cari Tahu',
                                      style: AppStyle(
                                          16.sp, Colors.white, FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'asset/MASKOT_SIRESMA.png',
                                scale: 1.45.dm,
                                filterQuality: FilterQuality.high,
                              ),
                              Image.asset(
                                'asset/image 19.png',
                                scale: 1.1.dm,
                                filterQuality: FilterQuality.high,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }
      },
    );
  }
}
