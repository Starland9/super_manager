// ignore_for_file: prefer_const_constructors, must_be_immutable


import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:super_manager/classes/manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/chart_age.dart';
import '../widgets/chart_heure_a.dart';
import '../widgets/dash_head.dart';
import '../widgets/sexe_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text("Tableau de bord"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DashHeaderWrap(),
            Wrap(
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(child: SexeChart()),
                    Expanded(
                      flex: 2,
                      child: EmpAge(),
                    ),
                  ],
                ),
                HeuresA(),
                SfCartesianChart(
                    title: ChartTitle(
                      text:
                          "Classement du personel en fonction de l'heure moyenne d'arrivé",
                    ),
                    // isTransposed: true,
                    primaryXAxis: CategoryAxis(),
                    series: [
                      BarSeries(
                        dataSource: Pmanager().personel,
                        xValueMapper: ((datum, index) =>
                            "${datum.nom} ${datum.prenom}"),
                        yValueMapper: ((datum, index) => datum.meanA()),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








