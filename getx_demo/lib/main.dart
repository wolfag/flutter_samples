import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/i18n/localization_service.dart';
import 'package:getx_demo/services/connectivity_service.dart';
import 'package:getx_demo/views/shopping_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Flutter Demo',
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppBinding(),
      home: ShoppingPage(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectServices();
  }

  void injectServices() {
    Get.put(ConnectivityService());
  }
}
