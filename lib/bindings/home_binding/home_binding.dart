import 'package:admconnect/pages/home/home_presenter.dart';
import 'package:admconnect/pages/new_research/new_research_presenter.dart';
import 'package:admconnect/presenters/home_presenter/home_presenter.dart';
import 'package:admconnect/presenters/new_research_presenter/new_research_presenter.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomePresenter>(GetXHomePresenter());
    Get.lazyPut<INewResearchPresenter>(() => GetXNewResearchPresenter());
  }
}