import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/admin/detail_nasabah_view_model.dart';
import 'package:siresma/view_models/admin/transaksi_admin_view_model.dart';
import 'package:siresma/views/admin/transaksi_admin/tabview_transaksi_admin.dart';

class TransaksiAdminScreen extends StatefulWidget {
  const TransaksiAdminScreen({super.key});

  @override
  State<TransaksiAdminScreen> createState() => _TransaksiAdminScreenState();
}

class _TransaksiAdminScreenState extends State<TransaksiAdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController AdmintabController;
  late TransaksiAdminViewModel transaksiAdminViewModel;
  late DetailNasabahViewModel detailNasabahViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transaksiAdminViewModel = Get.put(TransaksiAdminViewModel());
    detailNasabahViewModel = Get.put(DetailNasabahViewModel());

    AdmintabController = TabController(
      length: 12,
      initialIndex: transaksiAdminViewModel.tabIndex.value,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AdmintabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              app_bar(),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                if (transaksiAdminViewModel.isLoading.value &&
                    detailNasabahViewModel.nasabahdetail.value == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor1,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 6,
                                blurRadius: 5,
                                offset: Offset.fromDirection(1, 6))
                          ],
                        ),
                        child: Center(
                          child: Text(
                            detailNasabahViewModel
                                .nasabahdetail.value!.fullName,
                            style:
                                AppStyle(18.sp, Colors.white, FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 6,
                                blurRadius: 5,
                                offset: Offset.fromDirection(1, 6))
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Pendapatan",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Rp. ${transaksiAdminViewModel.transaksiadmin.value.data.totalIncome}",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Saldo Nasabah",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Rp. ${transaksiAdminViewModel.transaksiadmin.value.data.userIncome}",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Saldo Pengelola",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Rp. ${transaksiAdminViewModel.transaksiadmin.value.data.adminIncome}",
                                  style: AppStyle(
                                    14.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      tab_bar(),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Card tab_bar() {
    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 12,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            controller: AdmintabController,
                            onTap: (index) => transaksiAdminViewModel
                                .tabIndex.value = index,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            indicatorColor: primaryColor1,
                            indicatorWeight: 4,
                            tabs: [
                              Tab(
                                child: Text(
                                  "Januari",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Februari",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Maret",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "April",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Mei",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Juni",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Juli",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Agustus",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "September",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "October",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "November",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Desember",
                                  style: AppStyle(
                                    16.sp,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 500.h,
                            child: TabBarView(
                              controller: AdmintabController,
                              children: [
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 1,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 2,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 3,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 4,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 5,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 6,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 7,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 8,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 9,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 10,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 11,
                                ),
                                TabviewTransaksiAdmin(
                                  transactionadminItem:
                                      transaksiAdminViewModel
                                          .transaksiadminList,
                                  controller: transaksiAdminViewModel,
                                  monthIndex: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
  }

  Padding app_bar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          Image.asset(
            'asset/icon_tabungan.png',
            scale: 1.4.dm,
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Transaksi',
                style: AppStyle(
                  22.sp,
                  Colors.black,
                  FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: primaryColor1,
                ),
                width: 80.w,
                height: 5.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
