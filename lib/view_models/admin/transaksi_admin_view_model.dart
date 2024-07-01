import 'package:get/get.dart';
import 'package:siresma/config/api_admin_service.dart';
import 'package:siresma/models/transaksiadmin.dart';

class TransaksiAdminViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiAdminService apiAdminService = ApiAdminService();
  var transaksiadminList = <TransactionAdminItem>[].obs;
  var transaksiadmin = TransactionAdminModel(
    success: false,
    message: '',
    data: TransactionAdminData(
      items: [],
      totalIncome: 0,
      userIncome: 0,
      adminIncome: 0,
    ),
  ).obs;
  var tabIndex = 0.obs;

  Future<void> loadTransaksiAdmin(user_Id) async {
    await FetchTransaksiAdmin(user_Id);
    getCurrentMonth();
    update();
  }

  Future<void> FetchTransaksiAdmin(user_Id) async {
    try {
      isLoading(true);
      var fetchTransaksiAdmin =
          await apiAdminService.getDetailTransaksiNasabah(user_Id);
      transaksiadmin.value = fetchTransaksiAdmin;
      transaksiadminList.value = fetchTransaksiAdmin.data.items;
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  List<TransactionAdminItem> filterTransactionsByMonth(
      List<TransactionAdminItem> transactions, int selectedMonth) {
    return transactions.where((transaction) {
      final createdAtParts = transaction.createdAt.split('T')[0].split('-');
      final month = int.parse(createdAtParts[1]);
      return month == selectedMonth;
    }).toList();
  }

  void getCurrentMonth() {
    final now = DateTime.now();
    tabIndex.value = now.month - 1;
    // print("called, month : ${now.month}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final userId = Get.arguments;
    loadTransaksiAdmin(userId);
    update();
  }
}
