import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../new_research_presenter.dart';
import '../utils/get_snack_bar.dart';

class SendSectionComponent extends StatelessWidget {
  const SendSectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Obx(() {
        return TextButton(
          onPressed: presenter.filedsToResearchList.isEmpty
              ? null
              : () {
                  presenter.filedsToResearchList = [];
                  getSnackBar(
                    context,
                    title: 'Análise',
                    message: 'Seção enviada para análise!',
                    backgroundColor: Colors.yellow.shade700,
                  );
                },
          child: const Text(
            'Enviar',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
