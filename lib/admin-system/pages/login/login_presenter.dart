import 'package:admconnect/admin-system/mixins/loading_mixin.dart';
import 'package:admconnect/admin-system/presenters/users/user_view_model.dart';

abstract class ILoginPresenter implements LoadingMixin {
  bool get isToRegister;
  set isToRegister(bool value);

  bool get passwordVisible;
  set passwordVisible(bool value);

  void signOut();

  Future<void> updateInitialInfoUser(String uid, String name, String email);

  Future<UserViewModel?> verifyUserProfile();

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required Function(String) showSnackBar,
  });

  Future<void> signIn({
    required String email,
    required String password,
    required Function(String) showSnackBar,
  });
}
