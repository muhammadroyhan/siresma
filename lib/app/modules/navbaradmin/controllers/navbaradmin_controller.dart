import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:siresma/app/modules/datanasabah/views/datanasabah_view.dart';
import 'package:siresma/app/modules/profil/views/profil_view.dart';
import 'package:siresma/app/modules/qradmin/views/qradmin_view.dart';
import 'package:siresma/app/modules/setor/views/setor_view.dart';
import 'package:siresma/app/modules/transaksikeluar/views/transaksikeluar_view.dart';
import 'package:siresma/app/modules/transaksimasuk/views/transaksimasuk_view.dart';

import '../../../common/colors.dart';

class NavbarAdminController extends GetxController {
  //TODO: Implement NavbarController

  PersistentTabController controllertab =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      DataNasabahView(),
      TransaksiMasukView(),
      TransaksiKeluarView(),
      QrAdminView()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.userFriends,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.moneyBillWave,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.moneyBillTransfer,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.weightScale,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }
}
