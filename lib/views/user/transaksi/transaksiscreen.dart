import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/transaksi_view_model.dart';
import 'package:siresma/views/user/transaksi/tabview_transaksi.dart';

class Transaksiscreen extends StatefulWidget {
  const Transaksiscreen({super.key});

  @override
  State<Transaksiscreen> createState() => _TransaksiscreenState();
}

class _TransaksiscreenState extends State<Transaksiscreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TransaksiViewModel transaksiViewModel;

  @override
  void initState() {
    super.initState();
    transaksiViewModel = Get.put(TransaksiViewModel());

    tabController = TabController(
        length: 12,
        initialIndex: transaksiViewModel.tabIndex.value,
        vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => transaksiViewModel.loadFetchTransaksi(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                app_bar(),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () {
                    if (transaksiViewModel.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Saldo Anda :',
                                      style: AppStyle(
                                        18.sp,
                                        Colors.white,
                                        FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rp. ',
                                          style: AppStyle(
                                            18.sp,
                                            Colors.white,
                                            FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '${transaksiViewModel.transaksi.value.data.userBalance}',
                                          style: AppStyle(
                                            18.sp,
                                            Colors.white,
                                            FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'asset/icon_saldo.png',
                                  scale: 1.2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 12,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  controller: tabController,
                                  onTap: (index) =>
                                      transaksiViewModel.tabIndex.value = index,
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
                                    controller: tabController,
                                    children: [
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 1,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 2,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 3,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 4,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 5,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 6,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 7,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 8,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 9,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 10,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 11,
                                      ),
                                      TabViewTransaksi(
                                        transactionItem:
                                            transaksiViewModel.transaksionlist,
                                        controller: transaksiViewModel,
                                        monthIndex: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding app_bar() {
    return Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'asset/icon_tabungan.png',
                      scale: 1.4.dm,
                      filterQuality: FilterQuality.high,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transaksi Sampah',
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/tariktunai');
                      },
                      child: Image.asset(
                        'asset/image 56.png',
                        scale: 1.5.dm,
                      ),
                    ),
                  ],
                ),
              );
  }
}
