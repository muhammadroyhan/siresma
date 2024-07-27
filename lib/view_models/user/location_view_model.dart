import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/location.dart';
import 'package:siresma/view_models/user/home_view_model.dart';

class LocationViewModel extends GetxController {
  var isLoading = false.obs;
  var locations = List<Location>.empty().obs;
  Location? selectedLocation;
  ApiService apiService = ApiService();
  HomeViewModel homeViewModel = Get.put(HomeViewModel());

  void setSelectedLocation(Location? newValue) {
    selectedLocation = newValue;
    update(); // Manually call update to notify the UI of the change.
  }

  Future<void> loadFetchLocation() async {
    await FetchLocation();
    update();
  }

  Future<void> FetchLocation() async {
    try {
      isLoading(true);

      var fetchlocations = await apiService.fetchLocations();
      locations.value = fetchlocations;
      update();
    } catch (e) {
      isLoading(false);
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> postLocation(int trash_bank_id) async {
    isLoading(true);
    try {
      final response = await apiService.PostLocation(trash_bank_id);
      if (response != null && response.success) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('trash_bank_id', trash_bank_id);
        print(trash_bank_id);
        print(response.message);
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Pilih Lokasi Berhasil",
          response.message,
          colorText: Colors.white,
          backgroundColor: primaryColor1,
        );
        Timer(const Duration(seconds: 2), () {
          Get.offAndToNamed(
            '/usernavbar',
            arguments: homeViewModel.loadFetchHome(),
          );
        });
      } else {
        Get.snackbar(
          snackPosition: SnackPosition.TOP,
          "Pilih Lokasi Gagal",
          response!.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        snackPosition: SnackPosition.TOP,
        "Pilih Lokasi Gagal",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    loadFetchLocation();
    super.onInit();
  }
}
