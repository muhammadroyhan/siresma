import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/models/location.dart';
import 'package:siresma/view_models/user/location_view_model.dart';

class LocationScreen extends GetView<LocationViewModel> {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () => controller.loadFetchLocation(),
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(120.h),
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
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih Bank Sampah',
                          style: AppStyle(22.sp, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: primaryColor1,
                          ),
                          width: 85.w,
                          height: 5.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        DropdownButtonFormField<Location>(
                          style: AppStyle(
                            16.sp,
                            primaryColor1,
                            FontWeight.bold,
                          ),
                          hint: Text(
                            'Pilih Lokasi Bank Sampah',
                            style: AppStyle(
                              16.sp,
                              hintstyle,
                              FontWeight.bold,
                            ),
                          ),
                          iconDisabledColor: Colors.black,
                          iconEnabledColor: primaryColor1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: backgroundft,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          items: controller.locations.map((location) {
                            return DropdownMenuItem<Location>(
                              value: location,
                              child: Text(location.name),
                            );
                          }).toList(),
                          onChanged: (Location? newValue) {
                            controller.setSelectedLocation(newValue);
                          },
                        ),
                        SizedBox(
                          height: 340.h,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.selectedLocation == null) {
                                Get.snackbar(
                                  "Gagal Menyimpan Lokasi",
                                  "Pilih Lokasi Bank Sampah terlebih dahulu",
                                  snackPosition: SnackPosition.TOP,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                controller.postLocation(
                                  controller.selectedLocation!.id,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                160.w,
                                40.h,
                              ),
                              backgroundColor: primaryColor1,
                            ),
                            child: Text(
                              'Simpan',
                              style: AppStyle(
                                20.sp,
                                Colors.white,
                                FontWeight.bold,
                              ),
                            ),
                          ),
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
}
