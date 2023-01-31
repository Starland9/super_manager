// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../classes/manager.dart';

class EmpAge extends StatelessWidget {
  const EmpAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: "Classement des employés en fonction de leurs ages",
      ),
      primaryXAxis: CategoryAxis(
        interactiveTooltip: InteractiveTooltip(),
      ),
      series: [
        BarSeries(
          dataSource: Pmanager()
              .personel
              .map((e) => [
                    '${e.nom} ${e.prenom}',
                    e.age(),
                  ])
              .toList(),
          xValueMapper: (e, i) => e[0],
          yValueMapper: (e, i) => e[1] as int,
          dataLabelMapper: (e, i) => e[0] as String,
        )
      ],
    );
  }
}