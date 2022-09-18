import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../pages/login/login_presenter.dart';

class GetXLoginPresenter extends GetxController implements ILoginPresenter {
  final RxString _errorMessage = ''.obs;
  @override
  String get errorMessage => _errorMessage.value;
  @override
  set errorMessage(String value) => _errorMessage.value = value;

  final RxBool _loading = false.obs;
  @override
  bool get loading => _loading.value;
  @override
  set loading(bool value) => _loading.value = value;

  final RxBool _isToRegister = false.obs;
  @override
  bool get isToRegister => _isToRegister.value;
  @override
  set isToRegister(bool value) => _isToRegister.value = value;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.value = true;
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
        {
          'uid': userCredential.user!.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _errorMessage.value = 'The account already exists for that email.';
      } else {
        _errorMessage.value = e.message.toString();
      }
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _loading.value = false;
    }
  }
}
