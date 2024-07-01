import 'package:get/get.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/home.dart';

class HomeViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = ApiService();

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
      update();
    } catch (e) {
      print('Error: $e');
      update();
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    loadFetchHome();
    super.onInit();
  }
}
