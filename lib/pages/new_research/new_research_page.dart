import 'package:admconnect/pages/new_research/components/add_multiple_choose_component.dart';
import 'package:admconnect/pages/new_research/components/add_text_field_component.dart';
import 'package:admconnect/pages/new_research/components/build_research_component.dart';
import 'package:admconnect/pages/new_research/components/clear_section_component.dart';
import 'package:admconnect/pages/new_research/components/send_section_component.dart';
import 'package:admconnect/pages/new_research/new_research_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewResearchPage extends StatefulWidget {
  const NewResearchPage({Key? key}) : super(key: key);

  @override
  State<NewResearchPage> createState() => _NewResearchPageState();
}

class _NewResearchPageState extends State<NewResearchPage> {
  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();

    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.2,
                  maxHeight: MediaQuery.of(context).size.width * 0.34,
                ),
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: [
                      Obx(() {
                        presenter.filedsToResearchList;
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Perguntas ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  presenter.filedsToResearchList.isEmpty
                                      ? const SizedBox()
                                      : const Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                  Column(
                                    children: presenter.filedsToResearchList
                                        .map(
                                          (model) => BuildResearchComponent(
                                            researchViewModel: model,
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AddMultipleChooseComponent(),
                  AddTextFieldComponent(),
                  ClearSectionComponent(),
                  SendSectionComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
