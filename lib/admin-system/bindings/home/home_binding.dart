import 'package:admconnect/admin-system/pages/login/login_presenter.dart';
import 'package:admconnect/admin-system/pages/new_research/new_research_presenter.dart';
import 'package:admconnect/admin-system/presenters/home/getx_home_presenter.dart';
import 'package:admconnect/admin-system/presenters/login/getx_login_presenter.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/getx_new_research_presenter.dart';
import 'package:get/get.dart';

import '../../pages/home/home_presenter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ILoginPresenter>(GetXLoginPresenter());
    Get.put<IHomePresenter>(GetXHomePresenter());
    Get.lazyPut<INewResearchPresenter>(() => GetXNewResearchPresenter());
  }
}
