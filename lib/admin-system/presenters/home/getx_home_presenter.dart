import 'package:admconnect/admin-system/presenters/analysis_research/analysis_research_view_model.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/research_enum.dart';
import 'package:admconnect/admin-system/presenters/users/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/analysis_research/analysis_research_page.dart';
import '../../pages/home/home_presenter.dart';
import '../../pages/new_research/new_research_page.dart';
import '../../pages/report/report_page.dart';
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
          page: const AnalysisResearchPage(),
        ),
        ButtonSideBarViewModel(
          title: "Relatórios",
          icon: Icons.bar_chart_outlined,
          page: const ReportPage(),
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
  String getStatusForms(String statusCode) {
    switch (statusCode) {
      case 'analyzing':
        return "Analisando";
      case 'approved':
        return "Aprovado";
      default:
        return "Analisando";
    }
  }

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

  @override
  Stream<List<ResearchViewModel>> researches(String filterByStatus) {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('searches')
        .where('status', isEqualTo: filterByStatus)
        .withConverter<ResearchViewModel>(
          fromFirestore: (snapshot, _) =>
              ResearchViewModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .snapshots();
    final result = ref.map<List<ResearchViewModel>>((qShot) {
      return qShot.docs.map((doc) => doc.data()).toList();
    });
    return result;
  }

  @override
  Stream<List<ResearchViewModel>> userResearch(String filterByStatus) {
    final ref = FirebaseFirestore.instance
        .collection('searches')
        .where('users', arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: ResearchStatusEnum.approved.name)
        .withConverter<ResearchViewModel>(
          fromFirestore: (snapshot, _) =>
              ResearchViewModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .snapshots();
    final result = ref.map<List<ResearchViewModel>>((qShot) {
      return qShot.docs.map((doc) => doc.data()).toList();
    });
    return result;
  }
}
