import 'package:flutter/material.dart';
import 'package:footware_admin/pages/home_page.dart';
import 'package:footware_admin/pages/add_product_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:footware_admin/firebase_options.dart';
import 'controller/home_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      home: Home(),
      title: 'Footware Admin App',
      debugShowCheckedModeBanner: false,
    ),
  );
}
