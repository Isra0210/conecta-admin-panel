import 'package:get/get.dart';

import '../../pages/new_research/new_research_presenter.dart';
import 'research_view_model.dart';

class GetXNewResearchPresenter extends GetxController implements INewResearchPresenter {
  final RxList<ResearchViewModel> _filedsToResearchList = <ResearchViewModel>[].obs;
  @override
  List<ResearchViewModel> get filedsToResearchList => _filedsToResearchList;
  @override
  set filedsToResearchList(List<ResearchViewModel> value) => _filedsToResearchList.value = value;
  
  final RxString _titleToComponent = ''.obs;
  @override
  String get titleToComponent => _titleToComponent.value;
  @override
  set titleToComponent(String value) => _titleToComponent.value = value;
}