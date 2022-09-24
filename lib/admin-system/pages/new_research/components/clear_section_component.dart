import 'package:admconnect/admin-system/pages/new_research/new_research_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/get_snack_bar.dart';

class ClearSectionComponent extends StatelessWidget {
  const ClearSectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.red,
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
                    title: 'Deletado',
                    message: 'Seção deletada!',
                    backgroundColor: Colors.red,
                  );
                },
          child: const Text(
            'Limpar seção',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
