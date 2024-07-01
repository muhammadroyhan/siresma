import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/models/transaksiadmin.dart';
import 'package:siresma/view_models/admin/transaksi_admin_view_model.dart';

class TabviewTransaksiAdmin extends StatelessWidget {
  final List<TransactionAdminItem> transactionadminItem;
  final TransaksiAdminViewModel controller;
  final int monthIndex;
  const TabviewTransaksiAdmin({
    super.key,
    required this.transactionadminItem,
    required this.controller,
    required this.monthIndex,
  });

  @override
  Widget build(BuildContext context) {
    // final mediaQueryHeight = MediaQuery.of(context).size.height;

    final data = controller.transaksiadminList;
    List<TransactionAdminItem> sortedTransactions =
        controller.filterTransactionsByMonth(data, monthIndex);

    if (sortedTransactions.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: sortedTransactions.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
            ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '#${sortedTransactions[index].code}',
                          style: AppStyle(
                            16.sp,
                            Colors.black,
                            FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${sortedTransactions[index].day.toString()}-${sortedTransactions[index].month.toString()}-${sortedTransactions[index].year.toString()}',
                          style: AppStyle(
                            16.sp,
                            hintstyle,
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    sortedTransactions[index].type == "STORE"
                        ? Text(
                            "+ Rp. ${sortedTransactions[index].amount.toString()}",
                            style: AppStyle(
                              14.sp,
                              primaryColor1,
                              FontWeight.bold,
                            ),
                          )
                        : Text(
                            "- Rp. ${sortedTransactions[index].amount.toString()}",
                            style: AppStyle(
                              14.sp,
                              error,
                              FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Center(
        child: Text(
          "Tidak ada Transaksi pada bulan ini",
          style: AppStyle(
            14.sp,
            Colors.black,
            FontWeight.normal,
          ),
        ),
      );
    }
  }
}
