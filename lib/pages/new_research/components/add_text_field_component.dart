import 'package:admconnect/presenters/new_research_presenter/research_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/new_research_presenter/research_view_model.dart';
import '../new_research_presenter.dart';
import '../utils/get_snack_bar.dart';

class AddTextFieldComponent extends StatefulWidget {
  const AddTextFieldComponent({Key? key}) : super(key: key);

  @override
  State<AddTextFieldComponent> createState() => _AddTextFieldComponentState();
}

class _AddTextFieldComponentState extends State<AddTextFieldComponent> {
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
                              type: ResearchEnum.text.name,
                              options: const []
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
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0XFFf44336).withOpacity(0.9),
            const Color(0XFFec8d2f).withOpacity(0.9),
          ],
        ),
        color: Colors.orange,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: () {
          presenter.filedsToResearchList.length < 5
              ? addAnswerWidget()
              : getSnackBar(
                  context,
                  title: 'Ops!',
                  message: 'Você atingiu o número máximo de perguntas!',
                );
        },
        child: const Text(
          'Campo de texto',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
