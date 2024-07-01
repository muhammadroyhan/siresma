import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/config/api.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/models/edit_profil.dart';
import 'package:siresma/models/login.dart';
import 'package:siresma/models/otp.dart';
import 'package:siresma/models/register.dart';

class AuthService {
  Future<RegisterModel?> register(
    String namalengkap,
    String username,
    String nokk,
    String alamat,
    String nohp,
    String password,
    File? profilePicture,
  ) async {
    var request = https.MultipartRequest('POST', Uri.parse(API.register));
    request.headers.addAll({'accept': 'application/json'});
    request.fields.addAll({
      "full_name": namalengkap,
      "username": username,
      "no_kk": nokk,
      "address": alamat,
      "phone": nohp,
      "password": password,
    });

    if (profilePicture != null) {
      request.files.add(await https.MultipartFile.fromPath(
          'profile_picture', profilePicture.path));
    }
    try {
      final response = await request.send();
      final responseData = await https.Response.fromStream(response);

      print("Response status: ${responseData.statusCode}");
      print("Response body: ${responseData.body}");

      if (response.statusCode == 200 || response.statusCode == 400) {
        return RegisterModel.fromJson(json.decode(responseData.body));
      } else {
        print("Unhandled response status: ${responseData.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception in register request: $e");
      return null;
    }
  }

  Future<LoginModel?> login(String username, String password) async {
    try {
      https.Response response = await https.post(
        Uri.parse(API.login),
        headers: {
          // 'application': 'application/json',
          'Content-type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 400) {
        return LoginModel.fromJson(
          json.decode(response.body),
        );
      } else {
        print("Unhandled response status: ${response.statusCode}");
        return LoginModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("Exception in login request: $e");
      return null;
    }
  }

  Future<EditProfilModel?> editProfil(
    String fullname,
    String addres,
    String phone,
    File? profilePicture,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var request = https.MultipartRequest(
      'POST',
      Uri.parse(API.update_profil),
    );
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    request.fields.addAll({
      'full_name': fullname,
      'address': addres,
      'phone': phone,
    });
    if (profilePicture != null) {
      request.files.add(await https.MultipartFile.fromPath(
          'profile_picture', profilePicture.path));
    }
    final response = await request.send();
    final responseData = await https.Response.fromStream(response);

    if (response.statusCode == 200) {
      return EditProfilModel.fromJson(json.decode(responseData.body));
    } else {
      const SocketException('Failed to POST data');
    }
    return null;
  }

  Future<OtpModel?> otp(String otp_code) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = await prefs.getInt('user_id');
      print(userId);
      var response = await https.post(
        Uri.parse(API.otp),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'otp_code': otp_code,
        }),
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 400) {
        return OtpModel.fromJson(
          json.decode(response.body),
        );
      } else {
        print("Unhandled response status: ${response.statusCode}");
        return OtpModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print("Exception in login request: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    var response = await https.get(
      Uri.parse(API.logout),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(token);
      await prefs.remove('token');
      Map<String, dynamic> responseBody = json.decode(response.body);
      return responseBody;
    } else {
      throw Exception('Gagal Keluar');
    }
  }
}
