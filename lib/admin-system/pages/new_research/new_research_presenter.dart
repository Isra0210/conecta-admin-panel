import 'package:admconnect/admin-system/mixins/loading_mixin.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/research_view_model.dart';
import 'package:admconnect/admin-system/presenters/users/user_view_model.dart';

abstract class INewResearchPresenter implements LoadingMixin {
  List<ResearchViewModel> get filedsToResearchList;
  set filedsToResearchList(List<ResearchViewModel> value);
  
  String get titleToComponent;
  set titleToComponent(String value);
  
  Future<void> uploadForms();
  
  List<UserViewModel> get usersSelectedToForms;
  set usersSelectedToForms(List<UserViewModel> value);
}
