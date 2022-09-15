import 'package:get/get.dart';

import '../../pages/register/register_presenter.dart';
import '../../presenters/register/register_presenter.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IRegisterPresenter>(GetXRegisterPresenter());
  }
}
