import 'package:get/get.dart';
import 'package:siresma/config/api_admin_service.dart';
import 'package:siresma/models/transaksimasuk.dart';

class TransaksiMasukViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();
  var transaksimasuk = <TransaksiMasukData>[].obs;

  Future<void> loadTransaksiMasuk() async {
    await TransaksiMasuk();
    update();
  }

  Future<void> TransaksiMasuk() async {
    try {
      isLoading(true);
      var response = await apiAdminService.getTransaksiMasuk();
      if (response.success) {
        transaksimasuk.assignAll(response.data);
      } else {
        print(response.message);
      }
      update();
    } catch (e) {
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    loadTransaksiMasuk();
    // TODO: implement onInit
    super.onInit();
  }
}
