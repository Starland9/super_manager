// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:super_manager/pages/dashboard.dart';
import 'package:super_manager/pages/gestion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SidebarXController sidebarXController = SidebarXController(selectedIndex: 0);

  Widget curPage = DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            headerBuilder: ((context, extended) {
              if (extended) {
                return DrawerHeader(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "SUPER MANAGER",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ));
              }
              return SizedBox();
            }),
            theme: SidebarXTheme(
              selectedIconTheme: IconThemeData(
                size: 100,
              ),
              selectedItemDecoration: BoxDecoration(
                color: Colors.white,
              ),
              selectedItemMargin: EdgeInsets.all(0),
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
              ),
              selectedTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              itemDecoration: BoxDecoration(
                // color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 250,
            ),
            controller: sidebarXController,
            items: [
              SidebarXItem(
                  onTap: () {
                    setState(() {
                      curPage = DashBoard();
                    });
                  },
                  label: "  Tableau de bord",
                  iconWidget: NeumorphicIcon(Icons.dashboard)),
              SidebarXItem(
                  onTap: () {
                    setState(() {
                      curPage = GestionPage();
                    });
                  },
                  label: "  Gestion du personel",
                  iconWidget: NeumorphicIcon(CupertinoIcons.person_3_fill)),
            ],
          ),
          Expanded(child: curPage),
        ],
      ),
    );
  }
}
