// ignore_for_file: prefer_const_constructors


import 'package:flutter/foundation.dart';
import 'package:super_manager/classes/personel.dart';

class Pmanager {
  static final Pmanager _instance = Pmanager._internal();

  factory Pmanager() {
    return _instance;
  }

  Pmanager._internal() {
    personel.sort(((a, b) => a.tempArrive.compareTo(b.tempArrive)));

    presents = personel.where((element) => element.isPresent()).toList();
    absents = personel.where((element) => !element.isPresent()).toList();
  }

  late List<Personel> presents;
  late List<Personel> absents;

  List<Personel> personel = [
    Personel(
      matricule: "55447SI",
      nom: "Simo Talla",
      prenom: "Landry Brunel",
      dateNaiss: DateTime(2003, 11, 4),
      tempArrive: DateTime.now().add(Duration(days: -3)),
      tempDepart: DateTime.now()..add(Duration(days: 5)),
    ),
    Personel(
      matricule: "55447TA",
      nom: "Tamo Kamdem",
      prenom: "Eric",
      dateNaiss: DateTime(2002, 10, 14),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Bojeke",
      prenom: "Joyce",
      dateNaiss: DateTime(2004, 7, 7),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
      homme: false,
    ),
    Personel(
      matricule: "55447",
      nom: "Manga",
      prenom: "Landry",
      dateNaiss: DateTime(2001, 8, 24),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Kamdem",
      prenom: "Eric",
      dateNaiss: DateTime(2001, 1, 4),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Fotso",
      prenom: "Dieudonne",
      dateNaiss: DateTime(1974, 8, 14),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Fosto",
      prenom: "Emanuel",
      dateNaiss: DateTime(2010, 3, 10),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Gymogni",
      prenom: "Josephine",
      dateNaiss: DateTime(1974, 10, 13),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Fotso",
      prenom: "Merveille",
      dateNaiss: DateTime(2012, 6, 19),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Tamno",
      prenom: "Francis",
      dateNaiss: DateTime(1990, 7, 5),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
    Personel(
      matricule: "55447",
      nom: "Kamguia",
      prenom: "Cabrel",
      dateNaiss: DateTime(1998, 3, 17),
      tempArrive: DateTime.now(),
      tempDepart: DateTime.now()..add(Duration(hours: 8)),
    ),
  ];



  Personel? getPersonel(String matricule) {
    try {
      return personel
          .where((element) => (element.matricule == matricule))
          .first;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
