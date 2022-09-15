import 'package:admconnect/bindings/home_binding/home_binding.dart';
import 'package:admconnect/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel Connect',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HomePage.route,
      getPages: [
        GetPage(
          name: HomePage.route,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
      
      ],
    );
  }
}
