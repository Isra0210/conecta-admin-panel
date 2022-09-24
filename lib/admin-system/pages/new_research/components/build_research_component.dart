import 'package:admconnect/admin-system/pages/new_research/utils/get_snack_bar.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/research_enum.dart';
import 'package:admconnect/admin-system/presenters/new_research_presenter/research_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../new_research_presenter.dart';

class BuildResearchComponent extends StatefulWidget {
  const BuildResearchComponent({
    required this.researchViewModel,
    Key? key,
  }) : super(key: key);

  final ResearchViewModel researchViewModel;

  @override
  State<BuildResearchComponent> createState() => _BuildResearchComponentState();
}

class _BuildResearchComponentState extends State<BuildResearchComponent> {
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
    final bool isMultipleChoose =
        widget.researchViewModel.type == ResearchEnum.multipleChoose.name;

    Future<void> addOption() async {
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
                        const Text('Informe um título para essa opção'),
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
                          setState(() {
                            widget.researchViewModel.options
                                .add(controller.text);
                          });
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

    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${presenter.filedsToResearchList.indexOf(widget.researchViewModel) + 1}: ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.researchViewModel.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    isMultipleChoose
                        ? Tooltip(
                            message: 'Adicionar opção',
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                widget.researchViewModel.options.length < 3
                                    ? addOption()
                                    : getSnackBar(
                                        context,
                                        title: 'Ops!',
                                        message:
                                            'Você atingiu o máximo de opções',
                                      );
                              },
                            ),
                          )
                        : const SizedBox(),
                    Tooltip(
                      message: 'Excluir',
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final element = presenter.filedsToResearchList
                              .indexOf(widget.researchViewModel);
                          presenter.filedsToResearchList.removeAt(element);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
               alignment: Alignment.centerLeft,
               child: isMultipleChoose
                   ? Container(
                       margin: const EdgeInsets.fromLTRB(30, 16, 0, 16),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: widget.researchViewModel.options
                             .map(
                               (option) => Row(
                                 mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       const Icon(
                                         Icons.radio_button_off,
                                         size: 14,
                                       ),
                                       Container(
                                         margin: const EdgeInsets.only(left: 20),
                                         child: Text(
                                           option,
                                           style: const TextStyle(
                                             color: Colors.black,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w500,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                   IconButton(
                                     onPressed: () {
                                       setState(() {
                                         final index = widget
                                             .researchViewModel.options
                                             .indexOf(option);
                                         widget.researchViewModel.options
                                             .removeAt(index);
                                       });
                                     },
                                     icon: const Icon(
                                       Icons.delete,
                                       size: 16,
                                     ),
                                   )
                                 ],
                               ),
                             )
                             .toList(),
                       ),
                     )
                   : const SizedBox(),
             ),
          ],
        ),
      );
    });
  }
}
