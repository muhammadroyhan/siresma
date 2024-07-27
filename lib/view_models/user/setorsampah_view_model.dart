import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/kategori_sampah.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';
import 'package:siresma/view_models/user/tabungansampah_view_model.dart';
import 'package:siresma/view_models/user/usernavbar_view_model.dart';

class SetorSampahViewModel extends GetxController {
  final ProfileViewModel profileViewModel = Get.put(ProfileViewModel());
  final TabunganSampahViewModel tabunganSampahViewModel =
      Get.put(TabunganSampahViewModel());
  final UserNavbarViewModel userNavbarViewModel =
      Get.put(UserNavbarViewModel());

  TextEditingController dateCtrl = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  var isLoading = false.obs;
  var kategori = List<Kategori>.empty().obs;
  Kategori? selectedKategori;
  ApiService apiService = ApiService();

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update();
  }

  void setSelectedLocation(Kategori? newValue) {
    selectedKategori = newValue;
    update(); // Manually call update to notify the UI of the change.
  }

  void resetForm() {
    selectedDate.value = null;
    selectedKategori = null;
    update();
  }

  Future<void> loadSetorSampah() async {
    await FetchKategori();
    update();
  }

  Future<void> FetchKategori() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var trash_bank_id = await prefs.getInt('trash_bank_id');
      print("Mendapatkan $trash_bank_id");
      var fetchkategori = await apiService.fetchCategory();
      kategori.value = fetchkategori;
      print(kategori);
      await profileViewModel.loadUserPorfile();
      print(profileViewModel.loadUserPorfile());
      update();
    } catch (e) {
      isLoading(false);
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> postDepositTrash(
    String trash_category_id,
    String store_date,
  ) async {
    isLoading(true);
    try {
      final response =
          await apiService.depositTrash(trash_category_id, store_date);
      if (response!.success) {
        Timer(
          const Duration(seconds: 0),
          () {
            userNavbarViewModel.controllertab.jumpToTab(2);
            tabunganSampahViewModel.loadTabunganSampah();
          },
        );
        resetForm();
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Setor Sampah Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        isLoading.value = true;
      } else {
        isLoading.value = false;
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Setor Sampah Gagal",
          response.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Setor Sampah Gagal",
        "Pilih Lokasi Bank Sampah Terlebih Dahulu",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadSetorSampah();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadSetorSampah();
    update();
  }
}
