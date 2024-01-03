import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/modules/transaksiadmin/controllers/transaksiadmin_controller.dart';
import 'package:siresma/app/modules/transaksiadmin/views/tabview_transaksi_admin.dart';

class TransaksiAdminView extends StatefulWidget {
  const TransaksiAdminView({super.key});

  @override
  State<TransaksiAdminView> createState() => _TransaksiAdminViewState();
}

class _TransaksiAdminViewState extends State<TransaksiAdminView>
    with SingleTickerProviderStateMixin {
  late TabController adminTabController;
  late TransaksiadminController transaksiAdminController;

  @override
  void initState() {
    super.initState();
    transaksiAdminController = Get.put(TransaksiadminController());

    adminTabController = TabController(
        length: 12,
        initialIndex: transaksiAdminController.tabIndex.value,
        vsync: this);
  }

  @override
  void dispose() {
    adminTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double MediaQueryWidth = MediaQuery.of(context).size.width;
    final double MediaQueryHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          width: MediaQueryWidth,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/icon_tabungan.png',
                      scale: 1.6,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Transaksi',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: primary,
                          ),
                          width: MediaQueryWidth * 0.2,
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              Obx(() {
                final controller = Get.find<TransaksiadminController>();
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      Container(
                        width: MediaQueryWidth,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: primary,
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
                        child: reusableText(
                          "",
                          Colors.white,
                          18,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      Container(
                        width: MediaQueryWidth,
                        height: MediaQueryHeight * 0.13,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                reusableText(
                                  "Total Pendapatan",
                                  Colors.black,
                                  13,
                                  FontWeight.bold,
                                ),
                                reusableText(
                                  "Rp. ${controller.total_income.value}",
                                  Colors.black,
                                  14,
                                  FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                reusableText(
                                  "Total Saldo Nasabah",
                                  Colors.black,
                                  13,
                                  FontWeight.bold,
                                ),
                                reusableText(
                                  "Rp. ${controller.user_income.value}",
                                  Colors.black,
                                  14,
                                  FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                reusableText(
                                  "Total Saldo Pengelola",
                                  Colors.black,
                                  13,
                                  FontWeight.bold,
                                ),
                                reusableText(
                                  "Rp. ${controller.admin_income.value}",
                                  Colors.black,
                                  14,
                                  FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 16,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              controller: adminTabController,
                              tabs: [
                                Tab(
                                  child: Text(
                                    "Januari",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Februari",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Maret",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "April",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Mei",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Juni",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Juli",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Agustus",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "September",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "October",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "November",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Desember",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                              onTap: (index) => transaksiAdminController
                                  .tabIndex.value = index,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              indicatorColor: primary,
                              indicatorWeight: 4,
                            ),
                            SizedBox(
                              height: 400,
                              child: TabBarView(
                                controller: adminTabController,
                                children: [
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 1,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 2,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 3,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 4,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 5,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 6,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 7,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 8,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 9,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 10,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 11,
                                    ),
                                  ),
                                  Center(
                                    child: TabViewTransaksiAdmin(
                                      transactionAdminItem:
                                          controller.transactionadminData,
                                      controller: controller,
                                      monthIndex: 12,
                                    ),
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
              }),
            ],
          ),
        ),
      )),
    );
  }
}
