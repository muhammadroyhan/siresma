import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/config/api.dart';
import 'package:siresma/models/approve_dana.dart';
import 'package:siresma/models/datanasabah.dart';
import 'package:siresma/models/detailnasabah.dart';
import 'package:siresma/models/iot.dart';
import 'package:siresma/models/transaksiadmin.dart';
import 'package:siresma/models/transaksikeluar.dart';
import 'package:siresma/models/transaksimasuk.dart';

class ApiAdminService {
  Future<DataNasabahResponse> getDataNasabah() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse(API.data_nasabah),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return DataNasabahResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to load Data');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<DetailNasabahModel> getDetailNasabah(userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse('${API.detail_nasabah}?user_id=$userId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return DetailNasabahModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to load Data');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<IotModel?> postWeight(String weight) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      https.Response response = await https.post(
        Uri.parse(API.weight_iots),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'weight': weight,
        },
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 400) {
        return IotModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        print("Unhandled response status: ${response.statusCode}");
        return IotModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("Exception in login request: $e");
      return null;
    }
  }

  Future<TransaksiMasukModel> getTransaksiMasuk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse(API.transaksimasuk),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return TransaksiMasukModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Data');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<TransaksiKeluarModel> getTransaksiKeluar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse(API.transaksikeluar),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return TransaksiKeluarModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to load Data');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<ApproveDanaModel?> postApproveDana(int transactionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    https.Response response = await https.post(
      Uri.parse('${API.approvetransaksi}?transaction_id=$transactionId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return ApproveDanaModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to Post data');
    }
  }

  Future<TransactionAdminModel> getDetailTransaksiNasabah(userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse('${API.transaksi_admin}?user_id=$userId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return TransactionAdminModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to load Data');
      }
    } else {
      throw Exception('Token is Null');
    }
  }
}
