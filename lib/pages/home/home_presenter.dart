import 'package:admconnect/presenters/analysis_research/user_research_view_model.dart';
import 'package:flutter/material.dart';

import '../../presenters/analysis_research/user_research_view_model.dart';
import '../../presenters/home/models/button_side_bar_view_model.dart';
import '../../presenters/users/user_view_model.dart';

abstract class IHomePresenter {
  List<ButtonSideBarViewModel> get buttonsSideBarList;

  Widget get focusedPage;
  set focusedPage(Widget value);

  int get currentSideBarIndex;
  set currentSideBarIndex(int value);
  
  int get opSelected;
  set opSelected(int value);
  
  UserResearchViewModel? get userResearchViewModel;
  set userResearchViewModel(UserResearchViewModel? value);

  String getStatusForms(String statusCode);

  Stream<List<UserViewModel>> users();
  Stream<List<UserResearchViewModel>> researches(String filterByStatus);
  Stream<List<UserResearchViewModel?>?> userResearch(String filterByStatus);
}
