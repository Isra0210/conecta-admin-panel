import 'package:admconnect/admin-system/presenters/analysis_research/analysis_research_view_model.dart';
import 'package:flutter/material.dart';

import '../../presenters/home/models/button_side_bar_view_model.dart';
import '../../presenters/users/user_view_model.dart';

abstract class IHomePresenter {
  List<ButtonSideBarViewModel> get buttonsSideBarList;

  Widget get focusedPage;
  set focusedPage(Widget value);

  int get currentSideBarIndex;
  set currentSideBarIndex(int value);

  String getStatusForms(String statusCode);

  Stream<List<UserViewModel>> users();
  Stream<List<ResearchViewModel>> researches(String filterByStatus);
  Stream<List<ResearchViewModel>> userResearch(String filterByStatus);
}
