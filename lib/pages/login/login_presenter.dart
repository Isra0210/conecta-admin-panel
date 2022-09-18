abstract class ILoginPresenter {
  bool get loading;
  set loading(bool value);

  bool get isToRegister;
  set isToRegister(bool value);

  bool get passwordVisible;
  set passwordVisible(bool value);

  void signOut();

  Future<void> updateInitialInfoUser(String uid, String name, String email);

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
