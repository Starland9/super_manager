import 'package:flutter/material.dart';

import '../classes/manager.dart';
import 'cards.dart';

class DashHeaderWrap extends StatelessWidget {
  const DashHeaderWrap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InfoCard(
          title: Pmanager().presents.length.toString(),
          body: "Employés présents",
        ),
        InfoCard(
          title: Pmanager().absents.length.toString(),
          body: "Employés absents",
        ),
        InfoCard(
          title: Pmanager().presents[0].nom,
          body: "Premier à arriver",
        ),
        InfoCard(
          title: Pmanager().presents[Pmanager().presents.length - 1].nom,
          body: "Dernier à arriver",
        ),
        InfoCard(
          title: Pmanager()
              .personel
              .where((element) => !element.homme)
              .length
              .toString(),
          body: "Femmes",
        ),
        InfoCard(
          title: Pmanager()
              .personel
              .where((element) => element.homme)
              .length
              .toString(),
          body: "Hommes",
        ),
      ],
    );
  }
}
