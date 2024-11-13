import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/screens/homeScreen.dart';
import 'package:uianprt/screens/infoScreen.dart';
import 'package:uianprt/screens/reportScreen.dart';
import 'package:uianprt/screens/settingScreen.dart';
import 'package:uianprt/widgets/appbar.dart';

class MainView extends StatefulWidget {
  final String dbPath;
  MainView(this.dbPath);
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late DatabaseHelper _databaseHelper;
  Timer? _pollingTimer;
  int navIndex = Get.find<navController>().navIndex;

  
  @override
  void initState() {
    _databaseHelper = DatabaseHelper.withPath(widget.dbPath);

    _databaseHelper.queryAndEmitEntries();
    _pollingTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _databaseHelper.queryAndEmitEntries();
    });
    Get.find<videoController>()
        .player
        .open(Media("rtsp://admin:admin@192.168.1.89:554/stream"));
    //rtsp://admin:admin@192.168.1.88:554/stream
    Get.find<navController>().body=HomeScreen(databaseHelper: _databaseHelper,);

    super.initState();
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    _databaseHelper.dispose();
    Get.find<videoController>().player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ResponsiveNavigationBar(
        inactiveIconColor: Colors.white38,
        backgroundColor: Colors.transparent,
        selectedIndex: navIndex,
        showActiveButtonText: false,
        navigationBarButtons: [
          NavigationBarButton(
              backgroundColor: Colors.deepPurple, icon: Icons.info),
          NavigationBarButton(
              backgroundColor: Colors.deepPurple, icon: Icons.settings),
          NavigationBarButton(
              backgroundColor: Colors.deepPurple, icon: Icons.car_repair_outlined),
          NavigationBarButton(backgroundColor: const Color.fromARGB(255, 21, 19, 24), icon: Icons.home),
        ],
        onTabChange: (index) {
          switch (index) {
            case 0:
              navIndex = index;
               Get.find<navController>().body=Infoscreen();
              setState(() {});

              break;
              case 1:
                 navIndex = index;
                  Get.find<navController>().body=Settingscreen();
              setState(() {});
              break;
              case 2:
                 navIndex = index;
                  Get.find<navController>().body=ReportScreen();
              setState(() {});
              break;
               case 3:
               
                 navIndex = index;
                  Get.find<navController>().body=HomeScreen(databaseHelper: _databaseHelper);
              setState(() {});
              break;

            default:
                   navIndex = 3;
                      Get.find<navController>().body=HomeScreen(databaseHelper: _databaseHelper);
              setState(() {});
          }
        },
      ),
      appBar: MyAppBar(),
      backgroundColor: Colors.black,
      body: Get.find<navController>().body
    );
  }
}
