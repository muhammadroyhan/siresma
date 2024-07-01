import 'package:get/get.dart';
import 'package:siresma/config/api_admin_service.dart';
import 'package:siresma/models/detailnasabah.dart';

class DetailNasabahViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();
  final nasabahdetail = Rx<DetailNasabahModel?>(null);

  Future<void> loadDetailNasabah(user_id) async {
    await FetchDetailNasabah(user_id);
    update();
  }

  Future<void> FetchDetailNasabah(userId) async {
    try {
      isLoading(true);
      nasabahdetail.value = await apiAdminService.getDetailNasabah(userId);
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    final userId = Get.arguments;
    loadDetailNasabah(userId);
  }
}
