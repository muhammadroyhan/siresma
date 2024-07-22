import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/home.dart';
import 'package:siresma/view_models/user/profile_view_model.dart';

class HomeViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = ApiService();
  final ProfileViewModel profileViewModel = ProfileViewModel();

  var home = HomeModel(
    success: false,
    message: '',
    data: HomeData(
      id: 0,
      name: '',
      description: '',
    ),
  ).obs;

  Future<void> loadFetchHome() async {
    await FetchHome();
    update();
  }

  Future<void> FetchHome() async {
    try {
      isLoading(true);
      home.value = await apiService.fetchHome();
      print(home.value.data.id);
      update();
    } catch (e) {
      print('Error: $e');
      update();
    } finally {
      isLoading(false);
    }
  }

  late Timer _autoLogoutTimer; // New line

  void startAutoLogoutTimer() {
    _autoLogoutTimer = Timer(Duration(minutes: 30), () {
      profileViewModel.logout(); // Call the logout function after 60 minutes
      _autoLogoutTimer.cancel();
      Get.snackbar(
        "",
        "Silahkan Login lagi",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  @override
  void onInit() {
    startAutoLogoutTimer();
    loadFetchHome();
    super.onInit();
  }
}
