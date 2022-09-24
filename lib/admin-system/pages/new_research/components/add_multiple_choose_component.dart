import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/new_research_presenter/research_enum.dart';
import '../../../presenters/new_research_presenter/research_view_model.dart';
import '../new_research_presenter.dart';

class AddMultipleChooseComponent extends StatefulWidget {
  const AddMultipleChooseComponent({Key? key}) : super(key: key);

  @override
  State<AddMultipleChooseComponent> createState() =>
      _AddMultipleChooseComponentState();
}

class _AddMultipleChooseComponentState
    extends State<AddMultipleChooseComponent> {
  late TextEditingController controller;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();

    Future<void> addAnswerWidget() async {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 16, 30, 30),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Informe o título da pergunta'),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controller.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo não pode ser vazio!';
                        }
                        return null;
                      },
                      maxLength: 140,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          presenter.filedsToResearchList.add(
                            ResearchViewModel(
                              title: controller.text,
                              type: ResearchEnum.multipleChoose.name,
                              //ignore: prefer_const_literals_to_create_immutables
                              options:  [],
                            ),
                          );
                          Get.back();
                        }
                      },
                      child: const Text('Adicionar'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0XFF1e224c),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: () {
          addAnswerWidget();
        },
        child: const Text(
          'Múltipla escolha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
