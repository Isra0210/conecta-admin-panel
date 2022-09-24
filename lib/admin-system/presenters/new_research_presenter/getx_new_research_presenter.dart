import 'package:admconnect/admin-system/mixins/loading_mixin.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/research_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../pages/new_research/new_research_presenter.dart';
import '../users/user_view_model.dart';
import 'research_view_model.dart';

class GetXNewResearchPresenter extends GetxController
    with LoadingMixin
    implements INewResearchPresenter {
  final RxList<ResearchViewModel> _filedsToResearchList =
      <ResearchViewModel>[].obs;
  @override
  List<ResearchViewModel> get filedsToResearchList => _filedsToResearchList;
  @override
  set filedsToResearchList(List<ResearchViewModel> value) =>
      _filedsToResearchList.value = value;

  final RxString _titleToComponent = ''.obs;
  @override
  String get titleToComponent => _titleToComponent.value;
  @override
  set titleToComponent(String value) => _titleToComponent.value = value;

  final RxList<UserViewModel> _usersSelectedToForms = RxList<UserViewModel>([]);
  @override
  List<UserViewModel> get usersSelectedToForms => _usersSelectedToForms;
  @override
  set usersSelectedToForms(List<UserViewModel> value) =>
      _usersSelectedToForms.value = value;

  @override
  Future<void> uploadForms() async {
    final CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('searches');

    final String docId = ref.doc().id;

    await ref.doc(docId).set({
      'createdAt': FieldValue.serverTimestamp(),
      'createdBy': FirebaseAuth.instance.currentUser!.uid,
      'id': docId,
      'isActive': true,
      'status': ResearchStatusEnum.analyzing.name,
      'questions': [
        ..._filedsToResearchList.map((question) => question.toMap()),
      ],
      'answers': [],
      'users': [
        ...usersSelectedToForms.map((user) => user.id),
      ],
    });

    await FirebaseFirestore.instance.collection('searches').doc(docId).set(
      {
        'id': docId,
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': FirebaseAuth.instance.currentUser!.uid,
        'isActive': true,
        'status': ResearchStatusEnum.analyzing.name,
        'questions': [
          ..._filedsToResearchList.map((question) => question.toMap()),
        ],
        'answers': [],
        'users': [
          ...usersSelectedToForms.map((user) => user.id),
        ],
      },
    );
  }
}
