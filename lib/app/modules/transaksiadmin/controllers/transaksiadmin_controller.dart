import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/api.dart';
import '../../../models/transaksiadmin.dart';
import 'package:http/http.dart' as http;

class TransaksiadminController extends GetxController {
  final GlobalKey<FormState> transaksiFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController amountCtrl = TextEditingController();
  var transactionadminData = <TransactionAdminItem>[].obs;
  RxString total_income = ''.obs;
  RxString user_income = ''.obs;
  RxString admin_income = ''.obs;
  var isLoading = true.obs;

  var tabIndex = 0.obs;

  Future<void> fetchData(userId) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      if (token != null) {
        final headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final url = Uri.parse(API.transaksi_admin + '?user_id=$userId');
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final responseJson = json.decode(response.body);
          print(responseJson);

          final transactionadminModel =
              TransactionAdminResponse.fromJson(responseJson);
          total_income.value =
              json.encode(responseJson['data']['total_income']);
          user_income.value = json.encode(responseJson['data']['user_income']);
          admin_income.value =
              json.encode(responseJson['data']['admin_income']);
          final transactionListJson = responseJson['data'];
          transactionadminData.value = transactionadminModel.data.items;

          print(total_income.value);
          print(user_income.value);
          print(admin_income.value);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          print("Error : ${response.body}");
        }
      } else {
        print('Token is null or not available.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  List<TransactionAdminItem> filterTransactionsByMonth(
      List<TransactionAdminItem> transactions, int selectedMonth) {
    return transactions.where((transaction) {
      final createdAtParts = transaction.createdAt.split('T')[0].split('-');
      final month = int.parse(createdAtParts[1]);
      return month == selectedMonth;
    }).toList();
  }

  void getCurrentMonth() {
    final now = DateTime.now();
    tabIndex.value = now.month - 1;
    // print("called, month : ${now.month}");
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentMonth();
    var userId = Get.arguments;
    print(userId);
    fetchData(userId);
  }
}
