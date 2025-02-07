import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/model.dart';
import 'package:uianprt/model/storagedb/cameras.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/model/storagedb/registredDb.dart';
import 'package:uianprt/model/storagedb/users.dart';
import 'package:uianprt/widgets/videogetter.dart';

import '../model/storagedb/setting.dart';

class videoController extends GetxController {
  late final WebSocket soccket;
  bool isconnected = false;

  void connect(String url) {
    soccket = WebSocket(url);
    soccket.connect();
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
  TextEditingController socialNumber = TextEditingController();
  var role;
}

class Boxes extends GetxController {
    var nol=1.obs;

  //
  Box<RegistredDb> hivebox = Hive.box<RegistredDb>('regbox');
  List<RegistredDb> regBox = <RegistredDb>[];
  //
  Box<Users> userbox = Hive.box<Users>('userbox');

  //
  Box<Cameras> camerabox = Hive.box<Cameras>('camerabox');

  //
  Box<Setting> settingbox = Hive.box<Setting>('settingbox');
  void getregData() {
    regBox.clear();
    for (var values in hivebox.values) {
      regBox.add(values);
    }
  }

  @override
  void onReady() {
    getregData();

    super.onReady();
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }
}

class ReportController extends GetxController {

  DatabaseHelper databaseHelper = DatabaseHelper.withPath(path);
  List<plateModel> pModel = <plateModel>[];
  List<plateModel> selectedModel = <plateModel>[];
  String? selectedItem;
  String? firstdate;
  String? lastdate;
  String? firstime;
  String? lastTime;
  String? engishalphabet;
  var persianalhpabet = ''.obs;
  TextEditingController firtTwodigits = TextEditingController();
  TextEditingController threedigits = TextEditingController();
  TextEditingController lastTwoDigits = TextEditingController();
  String? platePicker;
  String? savePath;
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    pModel.clear();
    await databaseHelper.getEntriesAsList().then((value) {
      for (var json in value) {
        pModel.add(plateModel(
            imgpath: json.imgpath,
            plateNum: json.plateNum,
            charPercent: json.charPercent,
            eDate: json.eDate,
            eTime: json.eTime,
            isarvand: json.isarvand,
            rtpath: json.rtpath,
            scrnPath: json.scrnPath,
            platePercent: json.platePercent,
            status: json.status));
      }
    });
  }
}

class navController extends GetxController {
  int navIndex = 3;
  Widget? body;
}

class settingController extends GetxController {
  var psliderValue = 0.8.obs;
  var csliderValue = 0.75.obs;
  var hardWareValue = 'cuda';
  var pathOfdb = '../../../../engine/database/entrieses.db'.obs;
  var pathOfOutput = '../engine/'.obs;
  var clockType = '24';
  String timezoneseleted = "Asia/Tehran";
  String port = 5000.toString();
  String connect = 8000.toString();
  var isRfid=false.obs;
  var rl1=false.obs;
  var rl2=false.obs;
  String rfidip='192.168.1.91';
  int rfidport=2000;
  var alarm=false.obs;
  

  @override
  void onReady()async {
    if (Get.find<Boxes>().settingbox.isEmpty) {
   await   Get.find<Boxes>().settingbox.add(Setting(
          charConf: csliderValue.value,
          clockType: clockType,
          plateConf: psliderValue.value,
          dbPath: pathOfdb.value,
          outPutPath: pathOfOutput.value,
          hardWare: hardWareValue,
          timeZone: timezoneseleted,
          connect: connect,
          isRfid: isRfid.value
          ,port: port,
          rl1: rl1.value,
          rl2: rl2.value
          ,rfidip: rfidip,
          rfidport: rfidport,
          alarm: alarm.value
          ));

    } else {

    }
    super.onReady();
  }
}

class ViedoSocket extends GetxController {
  late final WebSocket socket;
  bool isConnected = false;

  void connect(BuildContext context, String url) async {
    socket = WebSocket(url);
    
    socket.connect();
    isConnected = true;
    update();
  }

  void disconnect() {

    socket.disconnect();

    isConnected = false;
    update();
  }
}
