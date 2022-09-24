import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/analysis_research/analysis_research_view_model.dart';
import '../home_presenter.dart';
import 'form_component.dart';

class ResearchComponent extends StatelessWidget {
  const ResearchComponent({
    required this.filterByStatus,
    Key? key,
  }) : super(key: key);

  final String filterByStatus;

  @override
  Widget build(BuildContext context) {
    final IHomePresenter presenter = Get.find<IHomePresenter>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<ResearchViewModel>>(
        stream: presenter.researches(filterByStatus),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0XFF1e224c)),
              ),
            );
          }

          if (snapshot.hasData) {
            List<ResearchViewModel> searches = snapshot.data!;
            if (searches.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum formulário encontrado!',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Formulários',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: FormComponent(searches: searches, status: filterByStatus),
                      )
                    ],
                  ),
                ),
              );
            }
          }

          return Text('${snapshot.data}');
        },
      ),
    );
  }
}
