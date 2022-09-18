abstract class ILoginPresenter {
  String get errorMessage;
  set errorMessage(String value);

  bool get loading;
  set loading(bool value);

  bool get isToRegister;
  set isToRegister(bool value);

  Future<void> register({
    required String name,
    required String email,
    required String password,
  });
}
