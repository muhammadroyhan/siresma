import 'package:get/get.dart';
import 'package:siresma/config/api_service.dart';
import 'package:siresma/models/transaksi.dart';

class TransaksiViewModel extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = ApiService();
  var transaksionlist = <TransactionItem>[].obs;
  var transaksi = TransactionResponse(
    success: false,
    message: '',
    data: TransactionData(
      userBalance: 0,
      oldest_data_month: '',
      newest_data_month: '',
      transactionList: [],
    ),
  ).obs;
  var tabIndex = 0.obs;

  Future<void> loadFetchTransaksi() async {
    await FetchTransaksi();
    getCurrentMonth();
    update();
  }

  Future<void> FetchTransaksi() async {
    try {
      isLoading(true);
      var fetchtransaksi = await apiService.fetchTransaksi();
      transaksi.value = fetchtransaksi;
      transaksionlist.value = fetchtransaksi.data.transactionList;
      update();
    } catch (e) {
      print('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  List<TransactionItem> filterTransactionsByMonth(
      List<TransactionItem> transactions, int selectedMonth) {
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
    loadFetchTransaksi();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    update();
    super.onReady();
  }
}
