import 'package:admconnect/admin-system/pages/home/adm_home_page.dart';
import 'package:admconnect/admin-system/pages/login/login_presenter.dart';
import 'package:admconnect/admin-system/presenters/users/user_view_model.dart';
import 'package:admconnect/user-system/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyUserPage extends StatelessWidget {
  const VerifyUserPage({Key? key}) : super(key: key);

  static const route = '/verifying-user';

  @override
  Widget build(BuildContext context) {
    final ILoginPresenter presenter = Get.find<ILoginPresenter>();

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: FutureBuilder<UserViewModel?>(
          future: presenter.verifyUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0XFF1e224c)),
                ),
              );
            }

            if (snapshot.hasData) {
              final UserViewModel user = snapshot.data!;

              if (user.isAdmin) {
                return const AdmHomePage();
              } else {
                return const HomePage();
              }
            }

            return const Center(
              child: Text('Algo deu errado!'),
            );
          },
        ),
      ),
    );
  }
}
