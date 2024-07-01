import 'package:get/get.dart';
import 'package:siresma/config/api_admin_service.dart';
import 'package:siresma/models/transaksikeluar.dart';

class TransaksiKeluarViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();
  var transaksikeluar = <TransaksiKeluarData>[].obs;

  Future<void> loadTransaksiKeluar() async {
    await TransaksiKeluar();
    update();
  }

  Future<void> TransaksiKeluar() async {
    try {
      isLoading(true);
      var response = await apiAdminService.getTransaksiKeluar();
      if (response.success) {
        transaksikeluar.assignAll(response.data);
        print(transaksikeluar.length);
      } else {
        print(response.message);
      }
    } catch (e) {
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> approveDana(int transaction_id) async {
    try {
      var response = await apiAdminService.postApproveDana(transaction_id);
      if (response!.success) {
        await loadTransaksiKeluar();
        print('Pencairan telah disetujui');
      } else {
        print('Pencairan gagal');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadTransaksiKeluar();
  }
}
