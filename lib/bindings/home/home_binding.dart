import 'package:admconnect/pages/new_research/new_research_presenter.dart';
import 'package:admconnect/presenters/home/home_presenter.dart';
import 'package:admconnect/presenters/new_research_presenter/new_research_presenter.dart';
import 'package:get/get.dart';

import '../../pages/home/home_presenter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomePresenter>(GetXHomePresenter());
    Get.lazyPut<INewResearchPresenter>(() => GetXNewResearchPresenter());
  }
}
