import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/users/user_view_model.dart';
import '../../home/home_presenter.dart';
import '../new_research_presenter.dart';

class SendSectionComponent extends StatefulWidget {
  const SendSectionComponent({Key? key}) : super(key: key);

  @override
  State<SendSectionComponent> createState() => _SendSectionComponentState();
}

class _SendSectionComponentState extends State<SendSectionComponent> {
  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();
    final IHomePresenter homePresenter = Get.find<IHomePresenter>();

    Future<void> selectUserToForms() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 16, 30, 30),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Seleciona os usuários'),
                            IconButton(
                              onPressed: () {
                                presenter.usersSelectedToForms = [];
                                Get.back();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<UserViewModel>>(
                        stream: homePresenter.users(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              margin: const EdgeInsets.only(top: 80),
                              child: const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Color(0XFF1e224c)),
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
                              return Obx(() {
                                return ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      leading: Checkbox(
                                        value: presenter
                                                .usersSelectedToForms.length ==
                                            users.length,
                                        onChanged: (value) {
                                          if (presenter.usersSelectedToForms
                                                  .length ==
                                              users.length) {
                                            presenter.usersSelectedToForms = [];
                                          } else {
                                            presenter.usersSelectedToForms =
                                                users;
                                          }
                                        },
                                      ),
                                      title: const Text("Selecionar todos"),
                                    ),
                                    ...users.map(
                                      (user) => ListTile(
                                        leading: Checkbox(
                                          value: presenter.usersSelectedToForms
                                              .contains(user),
                                          onChanged: (value) {
                                            if (presenter.usersSelectedToForms
                                                .contains(user)) {
                                              presenter.usersSelectedToForms
                                                  .remove(user);
                                            } else {
                                              presenter.usersSelectedToForms
                                                  .add(user);
                                            }
                                          },
                                        ),
                                        title: Text(user.name),
                                      ),
                                    ),
                                  ],
                                );
                              });
                            }
                          }

                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  Obx(() {
                    return presenter.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0XFF1e224c)),
                            ),
                          )
                        : TextButton(
                            onPressed: () async {
                              presenter.loading = true;
                              await presenter.uploadForms();
                              presenter.filedsToResearchList = [];
                              presenter.loading = false;
                              Get.back();
                            },
                            child: const Text('Enviar'),
                          );
                  })
                ],
              ),
            ),
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Obx(() {
        return TextButton(
          onPressed: presenter.filedsToResearchList.isEmpty
              ? null
              : () => selectUserToForms(),
          child: const Text('Enviar', style: TextStyle(color: Colors.white)),
        );
      }),
    );
  }
}
