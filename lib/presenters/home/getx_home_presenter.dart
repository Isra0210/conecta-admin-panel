import 'package:admconnect/pages/home/components/unimplemented_page.dart';
import 'package:admconnect/presenters/users/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home/home_presenter.dart';
import '../../pages/new_research/new_research_page.dart';
import '../../pages/users/users_page.dart';
import 'models/button_side_bar_view_model.dart';

class GetXHomePresenter extends GetxController implements IHomePresenter {
  @override
  List<ButtonSideBarViewModel> get buttonsSideBarList => [
        // ButtonSideBarViewModel(
        //   title: "Home",
        //   icon: Icons.home,
        //   page: const UnimplementedPage(pageName: 'Home'),
        // ),
        ButtonSideBarViewModel(
          title: "Nova pesquisa",
          icon: Icons.add,
          page: const NewResearchPage(),
        ),
        ButtonSideBarViewModel(
          title: "Pesquisas em análise",
          icon: Icons.content_paste_search,
          page: const UnimplementedPage(
            pageName: 'Pesquisas em análise',
          ),
        ),
        ButtonSideBarViewModel(
          title: "Relatórios",
          icon: Icons.bar_chart_outlined,
          page: const UnimplementedPage(
            pageName: 'Relatórios',
          ),
        ),
        ButtonSideBarViewModel(
          title: "Usuários",
          icon: Icons.group,
          page: const UsersPage(),
        ),
        // ButtonSideBarViewModel(
        //   title: "Retenção",
        //   icon: Icons.supervised_user_circle_rounded,
        //   page: const UnimplementedPage(
        //     pageName: 'Retenção',
        //   ),
        // ),
        // ButtonSideBarViewModel(
        //   title: "Histórico",
        //   icon: Icons.history_outlined,
        //   page: const UnimplementedPage(
        //     pageName: 'Histórico',
        //   ),
        // ),
        // ButtonSideBarViewModel(
        //   title: "Configurações",
        //   icon: Icons.settings,
        //   page: const UnimplementedPage(
        //     pageName: 'Configurações',
        //   ),
        // ),
        // ButtonSideBarViewModel(
        //   title: "Perfil",
        //   icon: Icons.account_circle,
        //   page: const UnimplementedPage(
        //     pageName: 'Perfil',
        //   ),
        // ),
        // ButtonSideBarViewModel(
        //   title: "Sobre",
        //   icon: Icons.info,
        //   page: const UnimplementedPage(
        //     pageName: 'Sobre',
        //   ),
        // ),
      ];

  final Rx<Widget> _focusedPage = Rx(const NewResearchPage());
  @override
  Widget get focusedPage => _focusedPage.value;
  @override
  set focusedPage(Widget value) => _focusedPage.value = value;

  final RxInt _currentSideBarIndex = 0.obs;
  @override
  int get currentSideBarIndex => _currentSideBarIndex.value;
  @override
  set currentSideBarIndex(int value) => _currentSideBarIndex.value = value;

  @override
  Stream<List<UserViewModel>> users() {
    final messagesReference = FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserViewModel>(
          fromFirestore: (snapshot, _) =>
              UserViewModel.fromMap(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .snapshots();

    final result = messagesReference.map<List<UserViewModel>>((qShot) {
      return qShot.docs.map((doc) => doc.data()).toList();
    });
    return result;
  }
}