import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/model.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/model/storagedb/registredDb.dart';


class videoController extends GetxController {
  late final player = Player();
  late final vController;

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    // Necessary initialization for package:media_kit.
    MediaKit.ensureInitialized();
    vController = VideoController(
      player,
    );

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

class tableController extends GetxController {
  var selectedIndex = -1;
  plateModel selectedmodel = plateModel();
}

class feildController extends GetxController {
  var carName = TextEditingController();
  var name = TextEditingController();
  var Fname = TextEditingController();
}

class Boxes extends GetxController {
  Box<RegistredDb> hivebox = Hive.box<RegistredDb>('regbox');
  List<RegistredDb> regBox = <RegistredDb>[];

  void getregData() {
    regBox.clear();
    for (var values in hivebox.values) {
      regBox.add(values);
    }
  }

  @override
  void onReady() {
    getregData();
    for(var val in regBox){
      print(val.carName);
    }
    super.onReady();
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }
}

class ReportController extends GetxController{
  DatabaseHelper databaseHelper=DatabaseHelper.withPath(path);
  List<plateModel> pModel=<plateModel>[];
  List<plateModel> selectedModel=<plateModel>[];
  String? selectedItem;
  String? firstdate;
  String? lastdate;
  String? firstime;
  String? lastTime;
  String? engishalphabet;
  var persianalhpabet=''.obs;
  TextEditingController firtTwodigits=TextEditingController();
  TextEditingController threedigits=TextEditingController();
  TextEditingController lastTwoDigits=TextEditingController();
  String? platePicker;
  @override
  void onInit() async {
   await getData();
    super.onInit();
  }

  getData() async {
    pModel.clear();
     await databaseHelper.getEntriesAsList().then(
      (value) {
        for (var json in value) {
          pModel.add(plateModel(
            imgpath:json.imgpath ,
              plateNum: json.plateNum,
              charPercent: json.charPercent,
              eDate: json.eDate,
              eTime: json.eTime,
              platePercent: json.platePercent,
              status: json.status));
        }});
        print(pModel[0].plateNum);
  }
  
}

class navController extends GetxController{
  int navIndex=3;
  Widget? body;

}

class settingController extends GetxController{
  var psliderValue=0.4.obs;
  var csliderValue=0.4.obs;
  var hardWareValue='opencl';




  







  
}