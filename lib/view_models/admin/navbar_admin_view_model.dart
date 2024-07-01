import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/views/admin/barcode_screen.dart';
import 'package:siresma/views/admin/nasabahscreen.dart';
import 'package:siresma/views/admin/transaksi_keluar_screen.dart';
import 'package:siresma/views/admin/transaksi_masuk_screen.dart';

class NavbarAdminViewModel extends GetxController {
  PersistentTabController controllertab =
      PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> tabs() => [
        PersistentTabConfig(
          screen: const Nasabahscreen(),
          item: ItemConfig(
            icon: const Icon(FontAwesomeIcons.users),
            iconSize: 24.sp,
            title: "Nasabah",
            textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const TransaksiMasukScreen(),
          item: ItemConfig(
            icon: const Icon(FontAwesomeIcons.moneyBill1Wave),
            iconSize: 24.sp,
            title: "Transaksi Masuk",
            textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const TransaksiKeluarScreen(),
          item: ItemConfig(
            icon: const Icon(FontAwesomeIcons.moneyBillTransfer),
            iconSize: 24.sp,
            title: "Transaksi Keluar",
            textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const BarcodeScreen(),
          item: ItemConfig(
            icon: const Icon(FontAwesomeIcons.weightScale),
            iconSize: 24.sp,
            title: "Barcode ",
            textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: Colors.white,
          ),
        ),
      ];
}
