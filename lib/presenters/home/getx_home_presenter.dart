import 'package:admconnect/presenters/analysis_research/user_research_view_model.dart';
import 'package:admconnect/presenters/new_research_presenter/research_enum.dart';
import 'package:admconnect/presenters/users/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/analysis_research/analysis_research_page.dart';
import '../../pages/home/home_presenter.dart';
import '../../pages/new_research/new_research_page.dart';
import '../../pages/report/report_page.dart';
import '../../pages/users/users_page.dart';
import '../analysis_research/user_research_view_model.dart';
import '../new_research_presenter/research_enum.dart';
import 'models/button_side_bar_view_model.dart';

class GetXHomePresenter extends GetxController implements IHomePresenter {
  @override
  List<ButtonSideBarViewModel> get buttonsSideBarList => [
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
  
  final RxInt _opSelected = (-1).obs;
  @override
  int get opSelected => _opSelected.value;
  @override
  set opSelected(int value) => _opSelected.value = value;
  
  final Rx<UserResearchViewModel?> _userResearchViewModel = Rx(null); 
  @override
  UserResearchViewModel? get userResearchViewModel => _userResearchViewModel.value;
  @override
  set userResearchViewModel(UserResearchViewModel? value) => _userResearchViewModel.value = value;

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
  Stream<List<UserResearchViewModel>> researches(String filterByStatus) {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('searches')
        .where('status', isEqualTo: filterByStatus)
        .withConverter<UserResearchViewModel>(
          fromFirestore: (snapshot, _) =>
              UserResearchViewModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .snapshots();
    final result = ref.map<List<UserResearchViewModel>>((qShot) {
      return qShot.docs.map((doc) => doc.data()).toList();
    });
    return result;
  }

  @override
  Stream<List<UserResearchViewModel?>> userResearch(String filterByStatus) {
    final ref = FirebaseFirestore.instance
        .collection('searches')
        .where('users', arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: ResearchStatusEnum.approved.name)
        .withConverter<UserResearchViewModel>(
          fromFirestore: (snapshot, _) =>
              UserResearchViewModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .snapshots();
    final result = ref.map<List<UserResearchViewModel>>((qShot) {
      return qShot.docs.map((doc) => doc.data()).toList();
    });
    return result;
  }
}
