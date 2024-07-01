import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/view_models/admin/navbar_admin_view_model.dart';

class Navbaradminscreen extends GetView<NavbarAdminViewModel> {
  const Navbaradminscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarAdminViewModel>(
      builder: (controller) {
        return PersistentTabView(
          controller: controller.controllertab,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          margin: const EdgeInsets.only(
            bottom: 8,
            right: 8,
            left: 8,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          tabs: controller.tabs(),
          navBarBuilder: (NavBarConfig) => Style2BottomNavBar(
            navBarDecoration: NavBarDecoration(
              color: primaryColor1,
              borderRadius: BorderRadius.circular(30),
            ),
            navBarConfig: NavBarConfig,
          ),
        );
      },
    );
  }
}