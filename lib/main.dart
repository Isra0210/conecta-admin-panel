import 'package:admconnect/admin-system/bindings/home/home_binding.dart';
import 'package:admconnect/admin-system/bindings/login/login_binding.dart';
import 'package:admconnect/firebase_options.dart';
import 'package:admconnect/admin-system/pages/home/adm_home_page.dart';
import 'package:admconnect/admin-system/pages/login/login_page.dart';
import 'package:admconnect/admin-system/pages/report_details/report_details_page.dart';
import 'package:admconnect/user-system/research/user_research_page.dart';
import 'package:admconnect/utils/verify_user_page.dart';
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
          if (Get.rawRoute!.settings.name != VerifyUserPage.route) {
            Get.offAllNamed(VerifyUserPage.route);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel Connect',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: LoginPage.route,
      onInit: () {
        handleUser(FirebaseAuth.instance.authStateChanges());
      }, 
      onReady: () {
        handleUser(FirebaseAuth.instance.authStateChanges());
      },
      getPages: [
        GetPage(
          name: AdmHomePage.route,
          page: () => const AdmHomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: LoginPage.route,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: ReportDetailsPage.route,
          page: () => const ReportDetailsPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: VerifyUserPage.route,
          page: () => const VerifyUserPage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: UserResearchPage.route,
          page: () => const UserResearchPage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
