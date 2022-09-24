import 'package:admconnect/presenters/new_research_presenter/research_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../pages/new_research/new_research_presenter.dart';
import 'research_view_model.dart';

class GetXNewResearchPresenter extends GetxController
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
      'isActive': true,
      'status': ResearchStatusEnum.analyzing.name,
      'questions': [
        ..._filedsToResearchList.map((question) => question.toMap()),
      ],
      'answers': [],
      'users': [],
    });

    await FirebaseFirestore.instance.collection('searches').doc(docId).set(
      {
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': FirebaseAuth.instance.currentUser!.uid,
        'isActive': true,
        'status': ResearchStatusEnum.analyzing.name,
        'questions': {},
        'answers': [],
        'users': [],
      },
    );
  }
}
