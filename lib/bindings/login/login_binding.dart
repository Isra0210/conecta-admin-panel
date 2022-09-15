import 'package:admconnect/pages/login/home_presenter.dart';
import 'package:get/get.dart';

import '../../presenters/login/login_presenter.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ILoginPresenter>(GetXLoginPresenter());
  }
}