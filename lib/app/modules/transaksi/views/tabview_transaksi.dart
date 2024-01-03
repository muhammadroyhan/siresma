import 'package:flutter/material.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/models/transaksi.dart';
import 'package:siresma/app/modules/transaksi/controllers/transaksi_controller.dart';

class TabViewTransaksi extends StatelessWidget {
  final List<TransactionItem> transactionItem;
  final TransaksiController controller;
  final int monthIndex;
  const TabViewTransaksi({
    super.key,
    required this.transactionItem,
    required this.controller,
    required this.monthIndex,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final data = controller.transactionData;
    List<TransactionItem> sortedTransactions =
        controller.filterTransactionsByMonth(data, monthIndex);

    if (sortedTransactions.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: sortedTransactions.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                bottom: 12,
                left: 8,
                right: 8,
              ),
              height: mediaQueryHeight * 0.12,
              child: Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          reusableText(
                            '#${sortedTransactions[index].code}',
                            Colors.black,
                            15,
                            FontWeight.bold,
                          ),
                          reusableText(
                            '${sortedTransactions[index].day.toString()}-${sortedTransactions[index].month.toString()}-${sortedTransactions[index].year.toString()}',
                            hints_text_setor,
                            15,
                            FontWeight.bold,
                          ),
                        ],
                      ),
                      sortedTransactions[index].type == "STORE"
                          ? reusableText(
                              "+ Rp. ${sortedTransactions[index].amount.toString()}",
                              primary,
                              14,
                              FontWeight.bold)
                          : reusableText(
                              "- Rp. ${sortedTransactions[index].amount.toString()}",
                              error,
                              14,
                              FontWeight.bold),
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      return reusableText("Tidak ada Transaksi pada bulan ini", Colors.black,
          14, FontWeight.normal);
    }
  }
}
