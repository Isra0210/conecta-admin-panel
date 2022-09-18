import 'package:admconnect/presenters/new_research_presenter/research_view_model.dart';

abstract class INewResearchPresenter {
  List<ResearchViewModel> get filedsToResearchList;
  set filedsToResearchList(List<ResearchViewModel> value);
  
  String get titleToComponent;
  set titleToComponent(String value);
  
  Future<void> uploadForms();
}
