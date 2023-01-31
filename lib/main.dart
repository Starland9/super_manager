// ignore_for_file: prefer_const_constructors

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:super_manager/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: "Super Manager",
      home: HomePage(),
      theme: NeumorphicThemeData(
          baseColor: Colors.white,
          accentColor: Colors.blue,
          textTheme: TextTheme(),
          appBarTheme: NeumorphicAppBarThemeData(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
