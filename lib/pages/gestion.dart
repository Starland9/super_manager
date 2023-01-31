// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getwidget/components/form/form_field/widgets/gf_formradiobutton.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:super_manager/classes/manager.dart';

class GestionPage extends StatefulWidget {
  const GestionPage({super.key});

  @override
  State<GestionPage> createState() => _GestionPageState();
}

class _GestionPageState extends State<GestionPage> {
  List<Map<String, dynamic>> selecteds = [];

  List<Map<String, dynamic>> datas = Pmanager()
      .personel
      .map((e) => <String, dynamic>{
            "matricule": e.matricule,
            "nom": e.nom,
            "prenom": e.prenom,
            "age": e.age(),
            "sexe": e.homme ? "♂️" : "♀️",
            "present": e.isPresent() ? "✅" : "👎️",
          })
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text("Gestion du personel"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ResponsiveDatatable(
                headerDecoration: BoxDecoration(
                  color: Colors.blue,
                ),
                headerTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
                rowDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                rowTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green.shade600,
                ),
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onSelect: ((value, data) {
                  if (value!) {
                    selecteds.add(datas.firstWhere((element) =>
                        element["matricule"] == data["matricule"]));
                  } else {
                    selecteds.remove(datas.firstWhere((element) =>
                        element["matricule"] == data["matricule"]));
                  }
                  setState(() {});
                }),

                // commonMobileView: true,
                showSelect: true,
                selecteds: selecteds,
                expanded: Pmanager().personel.map((e) => true).toList(),
                headers: [
                  DatatableHeader(text: "MATRICULE", value: "matricule"),
                  DatatableHeader(text: "NOM", value: "nom"),
                  DatatableHeader(text: "PRENOM", value: "prenom"),
                  DatatableHeader(text: "AGE", value: "age"),
                  DatatableHeader(text: "SEXE", value: "sexe"),
                  DatatableHeader(
                    text: "PRESENT",
                    value: "present",
                    sortable: true,
                  ),
                ],
                source: datas,
                actions: [
                  Expanded(
                    child: GFSearchBar(
                      searchList: [],
                      overlaySearchListItemBuilder: (s) => SizedBox(),
                      searchQueryBuilder: (s, l) {
                        return [];
                      },
                    ),
                  ),
                  if (selecteds.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () async {
                          var r = await showOkCancelAlertDialog(
                            context: context,
                            title: "Etes vous sûr de vouloir supprimer ?",
                          );
                        },
                        text: "SUPPRIMER",
                        color: Colors.red,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GFButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () async {
                        var r = await showOkCancelAlertDialog(
                          title: "Enregistrer un nouveau membre",
                          context: context,
                          builder: ((context, child) {
                            return NewPersoDialog(bas: child);
                          }),
                        );
                      },
                      text: "AJOUTER",
                      color: Colors.blue,
                    ),
                  ),
                  if (selecteds.isNotEmpty &&
                      selecteds.any((element) => element["present"] == "👎️"))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                        text: "METTRE PRESENT",
                        color: Colors.green,
                      ),
                    ),
                ],
                footers: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPersoDialog extends StatelessWidget {
  NewPersoDialog({
    Key? key,
    required this.bas,
  }) : super(key: key);

  final Widget bas;

  TextEditingController cDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Enregistrer un nouveau memebre"),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                Field(
                  hint: "Nom",
                ),
                Field(
                  hint: "Prénom",
                ),
                Field(
                  controller: cDate,
                  hint: "Date de naissance",
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value != null) {
                        cDate.text =
                            "${value.day}/${value.month}/${value.year}";
                      }
                    });
                  },
                ),
                GFRadioListTile(
                  value: 1,
                  groupValue: 1,
                  onChanged: (e) {},
                  titleText: "Homme",
                ),
                GFRadioListTile(
                  value: 0,
                  groupValue: 1,
                  onChanged: (e) {},
                  titleText: "Femme",
                ),
              ],
            ),
          ),
        ),
        bas,
      ],
    );
  }
}

class Field extends StatelessWidget {
  Field({
    Key? key,
    required this.hint,
    this.onTap,
    this.controller,
  }) : super(key: key);

  final String hint;
  void Function()? onTap;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GfFormField(
      gfFormFieldType: GfFormFieldType.text,
      editingbordercolor: Theme.of(context).primaryColor,
      idlebordercolor: Colors.black,
      borderwidth: 1,
      hintText: hint,
      backgroundcolor: Colors.transparent,
      onTap: onTap,
      controller: controller,
    );
  }
}
