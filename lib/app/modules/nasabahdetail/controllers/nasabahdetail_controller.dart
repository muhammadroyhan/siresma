import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:siresma/app/models/detailnasabah.dart';
import '../../../config/api.dart';

class NasabahDetailController extends GetxController {
  final nasabah = Rx<DetailDataNasabah?>(null);

  @override
  void onInit() {
    super.onInit();
    final userId = Get.arguments;
    getDetailNasabahFromUserId(userId);
  }

  Future<void> getDetailNasabahFromUserId( userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token != null) {
        final headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final url = Uri.parse(API.detail_nasabah + '?user_id=$userId');
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body)['data'];
          nasabah.value = DetailDataNasabah.fromJson(data);
          print(data);
        } else {
          print('Failed to fetch data: ${response.statusCode}');
          print(response.body);
        }
      } else {
        print('Token is null or not available.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
