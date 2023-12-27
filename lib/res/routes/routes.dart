import 'package:get/get.dart';
import 'package:siresma/res/routes/routes_name.dart';
import 'package:siresma/view/splashscreen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    // GetPage(
    //   name: RouteName.loginView,
    //   page: () => LoginView() ,
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade ,
    // ) ,
    // GetPage(
    //   name: RouteName.homeView,
    //   page: () => HomeView() ,
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade ,
    // ) ,
  ];
}