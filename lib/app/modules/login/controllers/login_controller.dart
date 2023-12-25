import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import '../../../models/datanasabah.dart';
import '../../../models/user.dart';
import 'dart:async';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  RxBool isAgree = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? validatePalindrome(String value) {
    if (value.isEmpty) {
      return 'Palindrome cannot be empty';
    }
    return null;
  }

  void setAgree(bool value) {
    isAgree.value = value;
  }

  Future<void> checkPalindrome() async {
    if (loginFormKey.currentState!.validate()) {
      // Get the password entered by the user
      String password = passwordCtrl.text.toLowerCase().replaceAll(' ', '');

      // Check if the password is a palindrome
      bool isPalindrome = _isPalindrome(password);

      // Show a message based on whether it's a palindrome or not
      if (isPalindrome) {
        Get.snackbar('Palindrome Check', 'The sentence is a palindrome');
      } else {
        Get.snackbar('Palindrome Check', 'The sentence is not a palindrome');
      }
    }
  }

  // Helper function to check if a string is a palindrome
  bool _isPalindrome(String s) {
    int start = 0;
    int end = s.length - 1;
    while (start < end) {
      if (s[start] != s[end]) {
        return false;
      }
      start++;
      end--;
    }
    return true;
  }
}
