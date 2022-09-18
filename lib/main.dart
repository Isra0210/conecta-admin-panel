import 'package:admconnect/bindings/home/home_binding.dart';
import 'package:admconnect/bindings/login/login_binding.dart';
import 'package:admconnect/firebase_options.dart';
import 'package:admconnect/pages/home/home_page.dart';
import 'package:admconnect/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void handleUser(Stream<User?> stream) {
    stream.listen(
      (user) async {
        if (user == null) {
          Get.offAllNamed(LoginPage.route);
        } else {
          if (Get.rawRoute!.settings.name != HomePage.route) {
            Get.offAllNamed(HomePage.route);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel Connect',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: LoginPage.route,
      onInit: () {
        handleUser(FirebaseAuth.instance.authStateChanges());
      },
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
      ],
    );
  }
}
