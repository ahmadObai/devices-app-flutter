import 'package:devices_app/core/class/http_clint.dart';
import 'package:devices_app/modules/home/binding/home_binding.dart';
import 'package:devices_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: (){
        Get.put(HttpClint());
        Get.log('======================Http Clint Inject=================');
      },
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
