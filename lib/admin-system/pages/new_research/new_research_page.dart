import 'package:admconnect/admin-system/pages/new_research/components/add_multiple_choose_component.dart';
import 'package:admconnect/admin-system/pages/new_research/components/add_text_field_component.dart';
import 'package:admconnect/admin-system/pages/new_research/components/build_research_component.dart';
import 'package:admconnect/admin-system/pages/new_research/components/clear_section_component.dart';
import 'package:admconnect/admin-system/pages/new_research/components/send_section_component.dart';
import 'package:admconnect/admin-system/pages/new_research/new_research_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class _SalesData {
//   _SalesData(this.year, this.sales);

//   final String year;
//   final double sales;
// }

class NewResearchPage extends StatefulWidget {
  const NewResearchPage({Key? key}) : super(key: key);

  @override
  State<NewResearchPage> createState() => _NewResearchPageState();
}

class _NewResearchPageState extends State<NewResearchPage> {
  @override
  Widget build(BuildContext context) {
    final INewResearchPresenter presenter = Get.find<INewResearchPresenter>();

    // List<_SalesData> data = [
    //   _SalesData('Jan', 35),
    //   _SalesData('Feb', 28),
    //   _SalesData('Mar', 34),
    //   _SalesData('Apr', 32),
    //   _SalesData('May', 40)
    // ];

    /**
     * Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings:const DataLabelSettings(isVisible: true))
          ]),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //Initialize the spark charts widget
          child: SfSparkLineChart.custom(
            //Enable the trackball
            trackball: const SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            //Enable marker
            marker: const 
                SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
            //Enable data label
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            xValueMapper: (int index) => data[index].year,
            yValueMapper: (int index) => data[index].sales,
            dataCount: 5,
          ),
        ),
      )
    ]);
     * 
     */

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
