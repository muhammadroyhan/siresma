import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/common/textformfield.dart';
import 'package:siresma/models/kategori_sampah.dart';
import 'package:siresma/view_models/user/setorsampah_view_model.dart';

class SetorSampahScreen extends GetView<SetorSampahViewModel> {
  const SetorSampahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetorSampahViewModel>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Obx(() {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () => controller.loadSetorSampah(),
                child: Scaffold(
                  body: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          app_bar(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Nama',
                            style: AppStyle(
                              18.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomTextFormFieldSetor(
                            initialValue: controller
                                .profileViewModel.user.value.data.fullName,
                            hint: 'Masukkan Nama Penyetor',
                            obscureText: false,
                            enable: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Kategori',
                            style: AppStyle(
                              18.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          DropdownButtonFormField<Kategori>(
                            style: AppStyle(
                              16.sp,
                              primaryColor1,
                              FontWeight.bold,
                            ),
                            hint: Text(
                              'Pilih Kategori Sampah An-ogranik',
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                            items: controller.kategori.map((kategori) {
                              return DropdownMenuItem<Kategori>(
                                value: kategori,
                                child: Text(kategori.categoryName),
                              );
                            }).toList(),
                            onChanged: (Kategori? newValue) {
                              controller.setSelectedLocation(newValue);
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Jenis Sampah : ',
                                style: AppStyle(
                                    18.sp, Colors.black, FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Anorganik',
                                style: AppStyle(
                                    18.sp, Colors.black, FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Tanggal Setor Sampah',
                            style: AppStyle(
                              18.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SetorSampah(context, controller),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Alamat',
                            style: AppStyle(
                              18.sp,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomTextFormFieldSetor(
                            initialValue: controller
                                .profileViewModel.user.value.data.address,
                            hint: 'Masukkan Alamat Penyetor',
                            obscureText: false,
                            enable: false,
                          ),
                          SizedBox(
                            height: 48.h,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.selectedKategori == null) {
                                  Get.snackbar(
                                    "Gagal Setor",
                                    "Pilih Kategori Sampah terlebih dahulu",
                                    snackPosition: SnackPosition.TOP,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red,
                                  );
                                  return;
                                } else if (controller.selectedDate.value ==
                                    null) {
                                  Get.snackbar(
                                    "Gagal Setor",
                                    "Pilih tanggal terlebih dahulu",
                                    snackPosition: SnackPosition.TOP,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red,
                                  );
                                  return;
                                } else {
                                  controller.postDepositTrash(
                                    controller.selectedKategori!.id.toString(),
                                    controller.selectedDate.value!
                                        .toIso8601String(),
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
          });
        }
      },
    );
  }

  DropdownButtonFormField<Kategori> dropdown_kategori(
      SetorSampahViewModel controller) {
    return DropdownButtonFormField<Kategori>(
      style: AppStyle(
        16.sp,
        primaryColor1,
        FontWeight.bold,
      ),
      hint: Text(
        'Pilih Kategori Sampah An-ogranik',
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
      items: controller.kategori.map((kategori) {
        return DropdownMenuItem<Kategori>(
          value: kategori,
          child: Text(kategori.categoryName),
        );
      }).toList(),
      onChanged: (Kategori? newValue) {
        controller.setSelectedLocation(newValue);
      },
    );
  }

  GestureDetector SetorSampah(
      BuildContext context, SetorSampahViewModel controller) {
    return GestureDetector(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: controller.selectedDate.value ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (newDate != null) {
          controller.updateSelectedDate(newDate);
          controller.dateCtrl.text =
              "${newDate.day}-${newDate.month}-${newDate.year}";
        }
      },
      child: TextFormField(
        controller: controller.dateCtrl,
        style: AppStyle(
          16.sp,
          primaryColor1,
          FontWeight.bold,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(
            FontAwesomeIcons.calendarPlus,
            color: primaryColor1,
          ),
          hintText: 'DD/MM/YY',
          hintStyle: AppStyle(
            16.sp,
            hintstyle,
            FontWeight.bold,
          ),
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
        enabled: false,
      ),
    );
  }

  Row app_bar() {
    return Row(
      children: [
        Image.asset(
          'asset/icon_setor.png',
          scale: 1.4.dm,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setor Sampah',
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
