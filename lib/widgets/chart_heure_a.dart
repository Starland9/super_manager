
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../classes/manager.dart';

class HeuresA extends StatelessWidget {
  const HeuresA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: "Evolution des heures d'arrivé du personel aucours de l'année",
      ),
      legend: Legend(
        isVisible: true,
      ),
      primaryXAxis: DateTimeAxis(
        maximum: DateTime.now(),
        minimum: DateTime(DateTime.now().year),
      ),
      series: Pmanager()
          .personel
          .map(
            (e) => LineSeries(
              enableTooltip: true,
              yAxisName: "Heures",
              name: '${e.nom} ${e.prenom}',
              dataSource: e.tempsA!.toList(),
              xValueMapper: (datum, index) {
                return datum;
              },
              yValueMapper: (e, i) {
                return e.hour;
              },
            ),
          )
          .toList(),
    );
  }
}