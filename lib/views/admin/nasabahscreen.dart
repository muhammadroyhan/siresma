import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/admin/nasabah_view_model.dart';

class Nasabahscreen extends GetView<NasabahViewModel> {
  const Nasabahscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NasabahViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              body: RefreshIndicator(
                onRefresh: () => controller.loadDataNasabah(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        app_bar(controller),
                        SizedBox(
                          height: 30.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.datanasabah.length,
                          itemBuilder: (context, index) {
                            var data = controller.datanasabah[index];
                            return Container(
                              height: 100.h,
                              padding: const EdgeInsets.only(
                                bottom: 4,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundColor: Colors.grey.shade400,
                                        backgroundImage: NetworkImage(
                                          data.profilePicture,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.fullName,
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle(
                                                  18.sp,
                                                  Colors.black,
                                                  FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              data.phone,
                                              overflow: TextOverflow.fade,
                                              style: AppStyle(
                                                14.sp,
                                                nasabahPhoneNumberTextColor,
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                backgroundColor: primaryColor1,
                                                minimumSize: Size(32.w, 32.h),
                                                padding: EdgeInsets.zero,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            onPressed: () {
                                              final selectedId = data.id;
                                              Get.toNamed('/transaksiadmin',
                                                  arguments: selectedId);
                                            },
                                            child: Image.asset(
                                              'asset/icon_trannsaksi.png',
                                              width: 26.w,
                                              height: 26.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                backgroundColor: primaryColor1,
                                                minimumSize: Size(32.w, 32.h),
                                                padding: EdgeInsets.zero,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            onPressed: () {
                                              final selectedId = data.id;
                                              Get.toNamed('/nasabahdetail',
                                                  arguments: selectedId);
                                            },
                                            child: Image.asset(
                                              'asset/icon_mata.png',
                                              width: 26.w,
                                              height: 26.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
        }
      },
    );
  }

  Row app_bar(NasabahViewModel controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'asset/icon_nasabah.png',
          scale: 0.8.dm,
          filterQuality: FilterQuality.high,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Nasabah',
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
            controller.logout();
          },
          child: Icon(
            FontAwesomeIcons.rightFromBracket,
            color: primaryColor1,
            size: 32.sp,
          ),
        ),
      ],
    );
  }
}
