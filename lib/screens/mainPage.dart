import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/screens/homeScreen.dart';
import 'package:uianprt/screens/reportScreen.dart';
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
  int index2 =3;
  @override
  void initState() {
    _databaseHelper = DatabaseHelper.withPath(widget.dbPath);

    _databaseHelper.queryAndEmitEntries();
    _pollingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _databaseHelper.queryAndEmitEntries();
    });
    Get.find<videoController>()
        .player
        .open(Media("rtsp://192.168.1.18:554/1/h264major"));
    //rtsp://admin:admin@192.168.1.88:554/stream
    


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
        selectedIndex: index2,
        showActiveButtonText: false,
        navigationBarButtons: [
          NavigationBarButton(
              backgroundColor: Colors.purple, icon: Icons.arrow_left),
          NavigationBarButton(
              backgroundColor: Colors.purple, icon: Icons.settings),
          NavigationBarButton(
              backgroundColor: Colors.purple, icon: Icons.car_repair_outlined),
          NavigationBarButton(backgroundColor: Colors.purple, icon: Icons.home),
        ],
        onTabChange: (index) {
          index2 = index;
          print(index2);
          setState(() {});
        },
      ),
      appBar: MyAppBar(),
      backgroundColor: Colors.black,
      body: index2==2?ReportScreen() : HomeScreen(databaseHelper: _databaseHelper),
    );
  }
}
