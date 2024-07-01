import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/config/api.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/models/chose_location.dart';
import 'package:siresma/models/home.dart';
import 'package:siresma/models/kategori_sampah.dart';
import 'package:siresma/models/location.dart';
import 'package:siresma/models/setor_sampah.dart';
import 'package:siresma/models/tabungan_sampah.dart';
import 'package:siresma/models/tariktunai.dart';
import 'package:siresma/models/transaksi.dart';
import 'package:siresma/models/user.dart';

class ApiService {
  Future<UserModel> getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse(API.get_profile),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<HomeModel> fetchHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      final response = await https.get(
        Uri.parse(API.home),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return HomeModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load home');
      }
    } else {
      throw Exception('Token is Null');
    }
  }

  Future<List<Location>> fetchLocations() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await https.get(
      Uri.parse(API.bank_sampah),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Location> locations = [];
      for (var item in jsonData['data']) {
        locations.add(Location.fromJson(item));
      }
      return locations;
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<ChoseLocation?> PostLocation(String trash_bank_id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await https.post(
        Uri.parse(API.choose_bank_sampah),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'trash_bank_id': trash_bank_id,
        },
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 400) {
        return ChoseLocation.fromJson(json.decode(response.body));
      } else {
        print("Unhandled response status: ${response.statusCode}");
        return ChoseLocation.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("Exception in login request: $e");
      return null;
    }
  }

  Future<List<Kategori>> fetchCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await https.get(
      Uri.parse(API.category_sampah),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Kategori> kategori = [];
      for (var item in jsonData['message']) {
        kategori.add(Kategori.fromJson(item));
      }
      return kategori;
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<PostTrashModel?> depositTrash(
    String trash_category_id,
    String store_date,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var trash_bank_id = prefs.getString('trash_bank_id');
    print(trash_bank_id);
    final response = await https.post(
      Uri.parse(API.setor_sampah),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'trash_category_id': trash_category_id,
        'trash_bank_id': trash_bank_id.toString(),
        'store_date': store_date,
      },
    );
    if (response.statusCode == 200) {
      return PostTrashModel.fromJson(json.decode(response.body));
    } else {
      const SocketException('Failed to POST data');
    }
    return null;
  }

  Future<TabunganModel> fetchTabungan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await https.get(
      Uri.parse(API.list_sampah),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final tabunganmodel = TabunganModel.fromJson(json.decode(response.body));
      tabunganmodel.data.trashStoreLogs.sort(
        (a, b) {
          if (a.status == 'Masih dalam Proses' &&
              b.status != 'Masih dalam Proses') {
            return -1; // Move 'Masih dalam Proses' status items to the top
          } else if (a.status != 'Masih dalam Proses' &&
              b.status == 'Masih dalam Proses') {
            return 1;
          } else {
            return 0;
          }
        },
      );
      return tabunganmodel;
    } else {
      throw Exception('Failed to load Tabungan');
    }
  }

  Future<TransactionResponse> fetchTransaksi() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await https.get(
      Uri.parse(API.list_transaksi),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return TransactionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load List Tranksaksi');
    }
  }

  Future<TarikTunaiModel?> postTarikSaldo(String tariksaldo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await https.post(
        Uri.parse(API.transaksi),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'amount': tariksaldo,
        },
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 400) {
        return TarikTunaiModel.fromJson(json.decode(response.body));
      } else {
        print("Unhandled response status: ${response.statusCode}");
        return TarikTunaiModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("Exception in login request: $e");
      return null;
    }
  }
}
