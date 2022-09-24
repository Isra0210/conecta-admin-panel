import 'package:admconnect/pages/analysis_research/components/form_analise_component.dart';
import 'package:admconnect/pages/home/home_presenter.dart';
import 'package:admconnect/presenters/analysis_research/analysis_research_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalysisResearch extends StatelessWidget {
  const AnalysisResearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IHomePresenter presenter = Get.find<IHomePresenter>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<AnalysisResearchViewModel>>(
        stream: presenter.researches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0XFF1e224c)),
              ),
            );
          }

          if (snapshot.hasData) {
            List<AnalysisResearchViewModel> searches = snapshot.data!;
            if (searches.isEmpty) {
              return const Center(
                child: Text(
                  'Não possui formulário em análise!',
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
                        'Formulários em análise',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: FormAnaliseComponent(searches: searches),
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
