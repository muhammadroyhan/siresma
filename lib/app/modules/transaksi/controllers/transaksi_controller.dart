import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/models/tabungan_sampah.dart';
import 'package:siresma/app/models/transaksi.dart';
import '../../../config/api.dart';
import '../../../models/transaksikeluar.dart';

class TransaksiController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var transactionData = <TransactionItem>[].obs;
  RxString user_balance = ''.obs;
  var isLoading = true.obs;

  var tabIndex = 0.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(API.list_transaksi);
    final response = await https.get(url, headers: headers);
    try {
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print(responseJson);
        final transactionModel = TransactionResponse.fromJson(responseJson);
        transactionData.value = transactionModel.data.transactionList;
        user_balance.value = json.encode(responseJson['data']['user_balance']);
        print(user_balance.value);
        update();
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print("Error : ${response.body}");
      }
    } catch (e) {
      isLoading.value = false;
      print("Error fetching data : ${e}");
    }
  }

  List<TransactionItem> filterTransactionsByMonth(
      List<TransactionItem> transactions, int selectedMonth) {
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
    getCurrentMonth();
    fetchData();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    update();
    super.onReady();
  }
}
