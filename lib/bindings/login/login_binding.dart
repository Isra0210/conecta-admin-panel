import 'package:get/get.dart';

import '../../pages/login/login_presenter.dart';
import '../../presenters/login/login_presenter.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ILoginPresenter>(GetXLoginPresenter());
  }
}