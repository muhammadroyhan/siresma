import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/admin/detail_nasabah_view_model.dart';

class DetailNasabahScreen extends GetView<DetailNasabahViewModel> {
  const DetailNasabahScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;

    return GetBuilder<DetailNasabahViewModel>(builder: (controller) {
      if (controller.nasabahdetail.value == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  app_bar(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Card(
                    child: SizedBox(
                      width: MediaQueryWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.nasabahdetail.value!.fullName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle(
                                24.sp,
                                Colors.black,
                                FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Transform.scale(
                              scale: 2.5.dm,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                backgroundImage: NetworkImage(
                                  controller
                                      .nasabahdetail.value!.profilePicture,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Nomor Kartu Keluarga',
                              style: AppStyle(
                                  17.sp, Colors.black, FontWeight.bold),
                            ),
                            Text(
                              controller.nasabahdetail.value!.noKk,
                              style: AppStyle(
                                15.sp,
                                Colors.grey,
                                FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Nomor Handphone',
                              style: AppStyle(
                                  17.sp, Colors.black, FontWeight.bold),
                            ),
                            Text(
                              controller.nasabahdetail.value!.phone,
                              style: AppStyle(
                                15.sp,
                                Colors.grey,
                                FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Alamat',
                              style: AppStyle(
                                  17.sp, Colors.black, FontWeight.bold),
                            ),
                            Text(
                              controller.nasabahdetail.value!.address,
                              style: AppStyle(
                                15.sp,
                                Colors.grey,
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  Row app_bar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'asset/icon_nasabah.png',
          scale: 0.8.dm,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Nasabah',
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
