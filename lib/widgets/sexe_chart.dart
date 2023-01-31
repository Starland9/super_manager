import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../classes/manager.dart';

class SexeChart extends StatelessWidget {
  const SexeChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: "Classement de sexe",
      ),
      legend: Legend(
        isVisible: true,
        isResponsive: false,
      ),
      series: [
        PieSeries(
          dataSource: [
            [
              "Homme",
              Pmanager().personel.where((element) => element.homme).length
            ],
            [
              "Femme",
              Pmanager().personel.where((element) => !element.homme).length
            ],
          ],
          xValueMapper: ((datum, index) => datum[0]),
          yValueMapper: ((datum, index) => datum[1]),
          dataLabelMapper: ((datum, index) => datum[0]),
          enableTooltip: true,
        ),
      ],
    );
  }
}