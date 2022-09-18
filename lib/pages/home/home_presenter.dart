import 'package:flutter/material.dart';

import '../../presenters/home/models/button_side_bar_view_model.dart';
import '../../presenters/users/user_view_model.dart';

abstract class IHomePresenter {
  List<ButtonSideBarViewModel> get buttonsSideBarList;

  Widget get focusedPage;
  set focusedPage(Widget value);

  int get currentSideBarIndex;
  set currentSideBarIndex(int value);
  
  Stream<List<UserViewModel>> users();
}
