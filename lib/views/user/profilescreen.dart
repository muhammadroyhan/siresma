import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';

class Profilescreen extends GetView<ProfileViewModel> {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return GetBuilder<ProfileViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Obx(
          () {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () => controller.loadUserPorfile(),
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(120.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/editprofile',
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor1,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 117.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 1.7.dm,
                                    child: controller.user.value.data
                                                .profilePicture !=
                                            false
                                        ? CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                            backgroundImage: NetworkImage(
                                              controller.user.value.data
                                                  .profilePicture,
                                            ),
                                          )
                                        : CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                            child: Icon(
                                                FontAwesomeIcons.solidUser,
                                                color: Colors.grey.shade300),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.user.value.data.fullName,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle(16.sp, Colors.black,
                                            FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.mobile,
                                            size: 13.sp,
                                            color: primaryColor1,
                                          ),
                                          SizedBox(
                                            width: 8.h,
                                          ),
                                          Text(
                                            controller.user.value.data.phone,
                                            style: AppStyle(13.sp, Colors.black,
                                                FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.solidAddressCard,
                                            size: 13.sp,
                                            color: primaryColor1,
                                          ),
                                          SizedBox(
                                            width: 8.h,
                                          ),
                                          Text(
                                            controller.user.value.data.noKk,
                                            style: AppStyle(13.sp, Colors.black,
                                                FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: SizedBox(
                    width: MediaQueryWidth,
                    height: MediaQueryHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 35,
                            left: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Akun",
                                style: AppStyle(
                                    17.sp, Colors.black, FontWeight.bold),
                              ),
                              SizedBox(
                                height: MediaQueryHeight * 0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: primaryColor1,
                                ),
                                width: 70.w,
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/transaksi');
                          },
                          leading: Icon(
                            FontAwesomeIcons.fileLines,
                            color: primaryColor1,
                            size: 32.sp,
                          ),
                          title: Text(
                            'Transaksi',
                            style:
                                AppStyle(16.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/evoucher');
                          },
                          leading: Icon(
                            FontAwesomeIcons.percent,
                            size: 32.sp,
                            color: primaryColor1,
                          ),
                          title: Text(
                            'E-Voucher',
                            style:
                                AppStyle(16.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/qrakun');
                          },
                          leading: Icon(
                            FontAwesomeIcons.qrcode,
                            color: primaryColor1,
                            size: 32.sp,
                          ),
                          title: Text(
                            'QR code Akun',
                            style:
                                AppStyle(16.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/keamanan');
                          },
                          leading: Icon(
                            FontAwesomeIcons.shieldHalved,
                            color: primaryColor1,
                            size: 32.sp,
                          ),
                          title: Text(
                            'Keamanan Akun',
                            style:
                                AppStyle(16.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Informasi Lainnya',
                                style: AppStyle(
                                  17.sp,
                                  Colors.black,
                                  FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: MediaQueryHeight * 0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: primaryColor1,
                                ),
                                width: 70.w,
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed('/privasi');
                          },
                          leading: Icon(
                            FontAwesomeIcons.lock,
                            color: primaryColor1,
                            size: 32.sp,
                          ),
                          title: Text(
                            'Ketentuan Privasi',
                            style:
                                AppStyle(16.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                          },
                          leading: Icon(
                            FontAwesomeIcons.rightFromBracket,
                            color: primaryColor1,
                            size: 32.sp,
                          ),
                          title: Text(
                            'Logout',
                            style:
                                AppStyle(17.sp, Colors.black, FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
