import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/transaksi/views/tabview_transaksi.dart';
import '../controllers/transaksi_controller.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({super.key});

  @override
  State<TransaksiView> createState() => _TransaksiViewState();
}

class _TransaksiViewState extends State<TransaksiView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TransaksiController transaksiController;

  @override
  void initState() {
    super.initState();
    transaksiController = Get.put(TransaksiController());

    tabController = TabController(
        length: 12,
        initialIndex: transaksiController.tabIndex.value,
        vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQueryWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/icon_tabungan.png',
                        scale: 1.6,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaksi',
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
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/tariksaldo');
                        },
                        child: Image.asset(
                          'assets/image/image 56.png',
                          scale: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.03,
                ),
                Obx(() {
                  final controller = Get.find<TransaksiController>();
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 20, bottom: 10),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saldo Anda :',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: MediaQueryHeight * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp. ',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        controller.user_balance.value,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/image/icon_saldo.png',
                                scale: 1.5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                                controller: tabController,
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
                                onTap: (index) =>
                                    transaksiController.tabIndex.value = index,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                indicatorColor: primary,
                                indicatorWeight: 4,
                              ),
                              SizedBox(
                                height: 500,
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 1,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 2,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 3,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 4,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 5,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 6,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 7,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 8,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 9,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 10,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
                                        controller: controller,
                                        monthIndex: 11,
                                      ),
                                    ),
                                    Center(
                                      child: TabViewTransaksi(
                                        transactionItem:
                                            controller.transactionData,
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
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
