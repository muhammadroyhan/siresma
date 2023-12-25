import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DataNasabahController extends GetxController {
  RxList<Map<String, dynamic>> users = RxList<Map<String, dynamic>>();
  var isLoading = true.obs;

  Future<void> loadData() async {
    await getDataNasabah();
  }

  Future<void> getDataNasabah() async {
    try {
      // Ganti URL dengan URL API yang sesuai
      var apiUrl = 'https://reqres.in/api/users?page=1&per_page=10';

      var response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        var responseData = response.data;

        // Ganti dengan ekstraksi data sesuai respons API Anda
        var userData = responseData['data'];

        users.assignAll(List<Map<String, dynamic>>.from(userData));
      } else {
        // Handle kesalahan status code jika diperlukan
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle kesalahan umum jika diperlukan
      print('Error loading data: $error');
    } finally {
      isLoading.value = false;
      update(); // Memperbarui tampilan
    }
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    loadData();
    super.onReady();
  }
}
