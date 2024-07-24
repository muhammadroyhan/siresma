import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/view_models/admin/navbar_admin_view_model.dart';

class Navbaradminscreen extends GetView<NavbarAdminViewModel> {
  const Navbaradminscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarAdminViewModel>(
      builder: (controller) {
        return PersistentTabView(
          context,
          screens: controller.buildScreen(),
          controller: controller.controllertab,
          items: controller.tabs(),
          confineToSafeArea: true,
          backgroundColor: primaryColor1,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          margin: const EdgeInsets.only(
            bottom: 8,
            right: 8,
            left: 8,
          ),
          animationSettings: const NavBarAnimationSettings(
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
          ),
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          navBarStyle: NavBarStyle.style7,
        );
      },
    );
  }
}
