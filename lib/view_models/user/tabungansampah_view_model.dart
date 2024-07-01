import 'package:get/get.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/tabungan_sampah.dart';

class TabunganSampahViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = ApiService();
  var tabungan = TabunganModel(
    success: false,
    message: '',
    data: TabunganData(userBalance: 0, trashStoreLogs: []),
  ).obs;

  Future<void> loadTabunganSampah() async {
    await FetchTabunganSampah();
    update();
  }

  Future<void> FetchTabunganSampah() async {
    try {
      isLoading(true);
      var fetchtabungan = await apiService.fetchTabungan();
      tabungan.value = fetchtabungan;
      update();
    } catch (e) {
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    loadTabunganSampah();
    super.onInit();
  }
}
