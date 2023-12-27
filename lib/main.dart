import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siresma/res/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Siresma",
    getPages: AppRoutes.appRoutes(),
  ));
}

