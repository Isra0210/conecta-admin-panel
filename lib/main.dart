import 'package:admconnect/bindings/home/home_binding.dart';
import 'package:admconnect/bindings/login/login_binding.dart';
import 'package:admconnect/pages/home/home_page.dart';
import 'package:admconnect/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/register/register_binding.dart';
import 'pages/register/register_page.dart';

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
      initialRoute: LoginPage.route,
      getPages: [
        GetPage(
          name: HomePage.route,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: LoginPage.route,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: RegisterPage.route,
          page: () => const RegisterPage(),
          binding: RegisterBinding(),
        ),
      ],
    );
  }
}
