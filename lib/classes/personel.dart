import 'dart:math';

class Personel {
  String matricule;
  String nom;
  String prenom;
  DateTime dateNaiss;
  DateTime tempArrive;
  DateTime tempDepart;
  bool isAdmin;
  bool homme;
  List<DateTime>? tempsA;
  List<DateTime>? tempsD;

  Personel({
    required this.matricule,
    required this.nom,
    this.prenom = "",
    required this.dateNaiss,
    required this.tempArrive,
    required this.tempDepart,
    this.isAdmin = false,
    this.homme = true,
    this.tempsA,
    this.tempsD,
  }) {
    matricule =
        nom.substring(0, 3) + (1000 + Random().nextInt(9999)).toString();

    if (tempsA == null) {
      tempsA = [];
      for (var i = 0; i < 30; i++) {
        tempsA!.add(
          DateTime(DateTime.now().year, 1, i, Random().nextInt(6) + 6),
        );
      }
    }
    if (tempsD == null) {
      tempsD = [];
      for (var i = 0; i < 30; i++) {
        tempsD!.add(DateTime(DateTime.now().year, 1, i));
      }
    }
  }

  bool isPresent() {
    return tempArrive.day == DateTime.now().day;
  }

  int age() {
    return DateTime.now().difference(dateNaiss).inDays ~/ 365;
  }

  double meanA() {
    int s = 0;
    for (var element in tempsA!) {
      s += element.hour;
    }
    return s / tempsA!.length;
  }
}
