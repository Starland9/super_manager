// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  List<List<Color>> colorPack = [
    [
      Colors.yellow.shade700,
      Colors.orange.shade700,
      Colors.red.shade700,
    ],
    [
      Colors.blue.shade700,
      Colors.purple.shade700,
      Colors.indigo.shade700,
    ],
    [
      Colors.green.shade700,
      Colors.greenAccent.shade700,
      Colors.lightGreen.shade700,
    ]
  ];

  @override
  Widget build(BuildContext context) {
    int pack = Random().nextInt(colorPack.length);

    List<Color> p1 = colorPack[pack];
    p1.shuffle();
    List<Color> p2 = p1.take(2).toList();

    return Container(
      decoration: BoxDecoration(
        // ignore: prefer_const_literals_to_create_immutables
        gradient: LinearGradient(
          // ignore: prefer_const_literals_to_create_immutables
          colors: p2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            body,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}