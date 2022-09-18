import 'package:admconnect/pages/home/home_presenter.dart';
import 'package:admconnect/presenters/users/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IHomePresenter presenter = Get.find<IHomePresenter>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<UserViewModel>>(
        stream: presenter.users(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0XFF1e224c)),
              ),
            );
          }

          if (snapshot.hasData) {
            List<UserViewModel> users = snapshot.data!;
            if (users.isEmpty) {
              return const Center(
                child: Text(
                  'Lista de usuário está vazia!',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(30),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(bottom: 20.0, left: 20),
                      child:  Text(
                        'Usuários',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    ...users.map(
                      (user) => ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Color(0XFF1e224c),
                        ),
                        title: Text(user.name),
                      ),
                    ),
                  ],
                ),
              );
            }
          }

          return const SizedBox();
        },
      ),
    );
  }
}
