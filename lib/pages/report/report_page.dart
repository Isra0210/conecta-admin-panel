import 'package:admconnect/pages/home/components/research_component.dart';
import 'package:flutter/material.dart';

import '../../presenters/new_research_presenter/research_enum.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResearchComponent(
      filterByStatus: ResearchStatusEnum.approved.name,
    );
  }
}
