import 'package:flutter/material.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/models/transaksiadmin.dart';
import 'package:siresma/app/modules/transaksiadmin/controllers/transaksiadmin_controller.dart';

class TabViewTransaksiAdmin extends StatelessWidget {
  final List<TransactionAdminItem> transactionAdminItem;
  final TransaksiadminController controller;
  final int monthIndex;
  const TabViewTransaksiAdmin({
    super.key,
    required this.transactionAdminItem,
    required this.controller,
    required this.monthIndex,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final data = controller.transactionadminData;
    List<TransactionAdminItem> sortedTransactions =
        controller.filterTransactionsByMonth(data, monthIndex);

    if (sortedTransactions.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: sortedTransactions.length,
          itemBuilder: (context, index) {
            final data = sortedTransactions[index];
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
                            '#${data.code}',
                            Colors.black,
                            15,
                            FontWeight.bold,
                          ),
                          reusableText(
                            '${data.day.toString()}-${data.month.toString()}-${data.year.toString()}',
                            hints_text_setor,
                            15,
                            FontWeight.bold,
                          ),
                        ],
                      ),
                      "${data.type}" == "STORE"
                          ? reusableText("+ Rp. ${data.amount.toString()}",
                              primary, 14, FontWeight.bold)
                          : reusableText("- Rp. ${data.amount.toString()}",
                              error, 14, FontWeight.bold)
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
