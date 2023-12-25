import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiKeluarController extends GetxController {
  RxList transaksi = [].obs;

  Future<void> loadTransaksi() async {
    await getTransaksiKeluar();
  }

  Future<void> getTransaksiKeluar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.transaksikeluar);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        transaksi.assignAll(List<Map<String, dynamic>>.from(data));
        print(data);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> approvePenarikan(int transactionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.approvetransaksi +
          '?transaction_id=$transactionId'); // Tambahkan ID transaksi ke URL
      http.Response response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        print("Penarikan disetujui");
        // Refresh transaksi data
        await loadTransaksi();
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    loadTransaksi();
    super.onInit();
  }
}
