import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/views/user/homescreen.dart';
import 'package:siresma/views/user/profilescreen.dart';
import 'package:siresma/views/user/setorsampahscreen.dart';
import 'package:siresma/views/user/tabungansampahscreen.dart';

class UserNavbarViewModel extends GetxController {
  PersistentTabController controllertab =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreen() {
    return [
      const HomeScreen(),
      const SetorSampahScreen(),
      const TabunganSampahScreen(),
      const Profilescreen(),
    ];
  }

  List<PersistentBottomNavBarItem> tabs() => [
        PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.house),
          iconSize: 24.sp,
          title: "Home",
          textStyle: AppStyle(12.sp, primaryColor1, FontWeight.normal),
          activeColorPrimary: Colors.white,
          activeColorSecondary: primaryColor1,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.trashArrowUp),
          iconSize: 24.sp,
          title: "Setor Sampah",
          textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
          activeColorPrimary: Colors.white,
          activeColorSecondary: primaryColor1,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.trashCan),
          iconSize: 24.sp,
          title: "Tabungan Sampah",
          textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
          activeColorPrimary: Colors.white,
          activeColorSecondary: primaryColor1,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.solidUser),
          iconSize: 24.sp,
          title: "Profil",
          textStyle: AppStyle(12.sp, Colors.white, FontWeight.normal),
          activeColorPrimary: Colors.white,
          activeColorSecondary: primaryColor1,
          inactiveColorPrimary: Colors.white,
        ),
      ];
  @override
  void onInit() {
    controllertab;
    tabs();
    // TODO: implement onInit
    super.onInit();
  }
}
