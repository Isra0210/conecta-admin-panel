import 'package:flutter/material.dart';

import '../../presenters/new_research_presenter/research_enum.dart';
import '../home/components/research_component.dart';

class AnalysisResearchPage extends StatelessWidget {
  const AnalysisResearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResearchComponent(filterByStatus: ResearchStatusEnum.analyzing.name);
  }
}
