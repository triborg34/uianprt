import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:uianprt/controller/mianController.dart';

import 'package:uianprt/model/consts.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone_utc_offset/timezone_utc_offset.dart';
import 'package:uianprt/model/storagedb/setting.dart';

class Generalsetting extends StatelessWidget {
  Generalsetting({super.key});

  // Get a list of available timezones

  @override
  Widget build(BuildContext context) {

    Get.find<settingController>().psliderValue.value =
        Get.find<Boxes>().settingbox.values.last.plateConf!;
    Get.find<settingController>().csliderValue.value =
        Get.find<Boxes>().settingbox.values.last.charConf!;
    Get.find<settingController>().hardWareValue =
        Get.find<Boxes>().settingbox.values.last.hardWare!;
    Get.find<settingController>().pathOfdb.value =
        Get.find<Boxes>().settingbox.values.last.dbPath!;
    Get.find<settingController>().pathOfOutput.value =
        Get.find<Boxes>().settingbox.values.last.outPutPath!;
    Get.find<settingController>().timezoneseleted =
        Get.find<Boxes>().settingbox.values.last.timeZone!;
    Get.find<settingController>().clockType =
        Get.find<Boxes>().settingbox.values.last.clockType!;


    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "سیستم",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 150,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FutursOfSystemRow(
                            lable: "دقت تشخیص پلاک:",
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Obx(() => SizedBox(
                                height: 10,
                                child: Slider(
                                  activeColor: selecetpurpule,
                                  inactiveColor: Colors.white70,
                                  value: Get.find<settingController>()
                                      .psliderValue
                                      .value,
                                  onChanged: (value) {
                                    Get.find<settingController>()
                                        .psliderValue
                                        .value = value;
                                   
                                  },
                                ),
                              )),
                          SizedBox(
                            width: 0,
                          ),
                          Obx(
                            () => Text(
                              "${(Get.find<settingController>().psliderValue.value * 100).round()}%",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          FutursOfSystemRow(
                            lable: "دقت تشخیص حروف:",
                          ),
                          Obx(() => SizedBox(
                                height: 10,
                                child: Slider(
                                  activeColor: selecetpurpule,
                                  inactiveColor: Colors.white70,
                                  value: Get.find<settingController>()
                                      .csliderValue
                                      .value,
                                  onChanged: (value) {
                                    Get.find<settingController>()
                                        .csliderValue
                                        .value = value;
                     
                                  },
                                ),
                              )),
                          SizedBox(
                            width: 0,
                          ),
                          Obx(
                            () => Text(
                              "${(Get.find<settingController>().csliderValue.value * 100).round()}%",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          FutursOfSystemRow(lable: "مسیر دیتابیس"),
                          ElevatedButton(
                            onPressed: () {
                              final file = OpenFilePicker()
                                ..filterSpecification = {
                                  'SQLite Database': '*.db',
                                }
                                ..initialDirectory = 'C:\\'
                                ..defaultFilterIndex = 0
                                ..defaultExtension = 'db';
                              Get.find<settingController>().pathOfdb.value =
                                  file.getFile()!.path;
                            },
                            child: Obx(
                              () => Text(
                                Get.find<settingController>()
                                            .pathOfdb
                                            .value
                                            .length >
                                        0
                                    ? Get.find<settingController>()
                                        .pathOfdb
                                        .value
                                        .split('\\')
                                        .last
                                    : "انتخاب",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            style:
                                TextButton.styleFrom(backgroundColor: purpule),
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 150,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FutursOfSystemRow(
                            lable: "نوع موتور:",
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 100,
                            decoration: BoxDecoration(
                                color: purpule,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "موتور 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          FutursOfSystemRow(
                            lable: "سخت افزار مورد استفاده ",
                          ),
                          DropdownMenu(
                              initialSelection:
                                  Get.find<settingController>().hardWareValue,
                              enableSearch: false,
                              enableFilter: false,
                              width: 150,
                              enabled: true,
                              textAlign: TextAlign.center,
                              onSelected: (value) {
                                Get.find<settingController>().hardWareValue =
                                    value!;
                              },
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(value: 'cuda', label: "CUDA"),
                                DropdownMenuEntry(
                                    value: 'opencl', label: "OpenCl"),
                                DropdownMenuEntry(value: 'cpu', label: "CPU")
                              ])
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          FutursOfSystemRow(lable: "مسیر تصاویر"),
                          ElevatedButton(
                            onPressed: () {
                              final file = DirectoryPicker();
                              Get.find<settingController>().pathOfOutput.value =
                                  file.getDirectory()!.path;
                     
                          
                            },
                            child: Obx(
                              () => Text(
                                Get.find<settingController>()
                                            .pathOfOutput
                                            .value
                                            .length >
                                        0
                                    ? Get.find<settingController>()
                                        .pathOfOutput
                                        .value
                                        .split('\\')
                                        .last
                                    : "انتخاب",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            style:
                                TextButton.styleFrom(backgroundColor: purpule),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("ذخیره"),
                  onPressed: () async {
                    var configFile = File('assets/config.json');
                    var configContent =
                        json.decode(configFile.readAsStringSync());

                    configContent['db_path'] = Get.find<settingController>()
                        .pathOfdb
                        .value
                        .replaceAll('\\', '/');
                    configContent['images_folder_path'] =
                        Get.find<settingController>()
                                .pathOfOutput
                                .value
                                .replaceAll('\\', '/') +
                            '/';

                    configFile.writeAsStringSync(json.encode(configContent));
                 
                    await Get.find<Boxes>().settingbox.add(
                          Setting(
                            alarm: Get.find<Boxes>().settingbox.values.last.alarm!,
                            connect: Get.find<Boxes>().settingbox.values.last.connect!,
                            isRfid:Get.find<Boxes>().settingbox.values.last.isRfid! ,
                            port: Get.find<Boxes>().settingbox.values.last.port!,
                            rl1: Get.find<Boxes>().settingbox.values.last.rl1!,
                            rl2: Get.find<Boxes>().settingbox.values.last.rl2!,
                            rfidip: Get.find<Boxes>().settingbox.values.last.rfidip!,
                            rfidport: Get.find<Boxes>().settingbox.values.last.rfidport!,

                              plateConf: Get.find<settingController>()
                                  .psliderValue
                                  .value,
                              charConf: Get.find<settingController>()
                                  .csliderValue
                                  .value,
                              hardWare:
                                  Get.find<settingController>().hardWareValue,
                              dbPath:
                                  Get.find<settingController>().pathOfdb.value,
                              outPutPath: Get.find<settingController>()
                                  .pathOfOutput
                                  .value,
                              timeZone:
                                  Get.find<settingController>().timezoneseleted,
                              clockType:
                                  Get.find<settingController>().clockType),
                        ).then((value) => Get.snackbar("ذخیره شد", "",colorText: Colors.white),);
                        

          

                    Dio dio = Dio();
                    var res =
                        await dio.post('http://127.0.0.1:${Get.find<Boxes>().settingbox.values.last.connect}/config', data: {
                      "section": "DEFAULT",
                      "key": "character_confidence",
                      "value": Get.find<settingController>()
                          .csliderValue
                          .value
                          .toStringAsFixed(2)
                    });
                    if (res.statusCode == 200) {
                      await dio.post("http://127.0.0.1:${Get.find<Boxes>().settingbox.values.last.connect}/config", data: {
                        "section": "DEFAULT",
                        "key": "plate_confidence",
                        "value":
                            (Get.find<settingController>().psliderValue.value *
                                    100)
                                .toInt()
                                .toString()
                      });
                      await dio.post("http://127.0.0.1:${Get.find<Boxes>().settingbox.values.last.connect}/config", data: {
                        "section": "DEFAULT",
                        "key": "device",
                        "value": Get.find<settingController>()
                            .hardWareValue
                            .toString()
                      });
                    Get.snackbar("", "ذخیره شد");
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("پیش فرض"),
                  onPressed: () async {
                  await  Get.find<Boxes>().settingbox.clear();
                    await Get.find<Boxes>().settingbox.add(
                          Setting(

                          alarm: Get.find<settingController>().alarm.value,
                              plateConf: Get.find<settingController>().psliderValue.value,
                              charConf: Get.find<settingController>().csliderValue.value,
                              hardWare: Get.find<settingController>().hardWareValue,
                              dbPath:Get.find<settingController>().pathOfdb.value, 
                              outPutPath: Get.find<settingController>().pathOfOutput.value,
                              timeZone: Get.find<settingController>().timezoneseleted,
                              clockType: Get.find<settingController>().clockType,
                              connect:  Get.find<settingController>().connect,
                              isRfid: Get.find<settingController>().isRfid.value,
                              port: Get.find<settingController>().port,
                              rl1: Get.find<settingController>().rl1.value,
                              rl2: Get.find<settingController>().rl2.value,
                              rfidip: Get.find<settingController>().rfidip,
                              rfidport: Get.find<settingController>().rfidport

                              )

                        ).then((value) => Get.snackbar("", "پیش فرض شد"),);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "زمان و تاریخ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  FutursOfSystemRow(lable: "منطقه زمانی : "),
                  DropdownMenu(
                      width: 250,
                      onSelected: (value) {
                        Get.find<settingController>().timezoneseleted = value!;
                      },
                      initialSelection:
                          Get.find<settingController>().timezoneseleted,
                      textStyle:
                          TextStyle(color: Colors.white, fontFamily: 'arial'),
                      dropdownMenuEntries: [
                        for (var timezone
                            in tz.timeZoneDatabase.locations.keys.toList())
                          DropdownMenuEntry(
                              style: ButtonStyle(
                                  textStyle: WidgetStatePropertyAll(
                                      TextStyle(fontFamily: 'arial'))),
                              value: timezone,
                              label:
                                  "${timezone.split('/')[1]} : UTC(${getTimezoneUTCOffset(timezone).toString().contains('-') ? '' : "+"}${(getTimezoneUTCOffset(timezone)!.inMinutes / 60).toString().replaceFirst('.', ':')})")
                      ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  FutursOfSystemRow(lable: "نوع قالب"),
                  DropdownMenu(
                      initialSelection: Get.find<settingController>().clockType,
                      enableSearch: false,
                      enableFilter: false,
                      textStyle: TextStyle(color: Colors.white),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "24", label: "24 ساعت"),
                        DropdownMenuEntry(value: "12", label: "12 ساعت")
                      ]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("ذخیره"),
                  onPressed: () async {
                    await Get.find<Boxes>().settingbox.add(
                          Setting(
                            alarm: Get.find<Boxes>().settingbox.values.last.alarm!,
                                                        connect: Get.find<Boxes>().settingbox.values.last.connect!,
                            isRfid:Get.find<Boxes>().settingbox.values.last.isRfid! ,
                            port: Get.find<Boxes>().settingbox.values.last.port!,
                            rl1: Get.find<Boxes>().settingbox.values.last.rl1!,
                            rl2: Get.find<Boxes>().settingbox.values.last.rl2!,
                            rfidip: Get.find<Boxes>().settingbox.values.last.rfidip!,
                            rfidport: Get.find<Boxes>().settingbox.values.last.rfidport!,
                              plateConf: Get.find<settingController>()
                                  .psliderValue
                                  .value,
                              charConf: Get.find<settingController>()
                                  .csliderValue
                                  .value,
                              hardWare:
                                  Get.find<settingController>().hardWareValue,
                              dbPath:
                                  Get.find<settingController>().pathOfdb.value,
                              outPutPath: Get.find<settingController>()
                                  .pathOfOutput
                                  .value,
                              timeZone:
                                  Get.find<settingController>().timezoneseleted,
                              clockType:
                                  Get.find<settingController>().clockType),
                        ).then((value) => Get.snackbar("ذخیره شد", "",colorText: Colors.white),);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("پیش فرض"),
                  onPressed: () async{
                        await  Get.find<Boxes>().settingbox.clear();
                    await Get.find<Boxes>().settingbox.add(
                          Setting(
                            alarm: Get.find<settingController>().alarm.value,
                              plateConf: Get.find<settingController>().psliderValue.value,
                              charConf: Get.find<settingController>().csliderValue.value,
                              hardWare: Get.find<settingController>().hardWareValue,
                              dbPath: Get.find<settingController>().pathOfdb.value,
                              outPutPath: Get.find<settingController>().pathOfOutput.value,
                              timeZone: Get.find<settingController>().timezoneseleted,
                              clockType: Get.find<settingController>().clockType,
                              connect: Get.find<settingController>().connect,
                              isRfid: Get.find<settingController>().isRfid.value,
                              port: Get.find<settingController>().port,
                              rl1: Get.find<settingController>().rl1.value,
                              rl2: Get.find<settingController>().rl2.value,
                              rfidip: Get.find<settingController>().rfidip,
                              rfidport: Get.find<settingController>().rfidport
                          )
                        ).then((value) => Get.snackbar("", "پیش فرض شد"),);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "اطلاعات",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "نسخه نرم افزار:"),
                      Text(
                        "1.0.0",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "نوع مجوز:"),
                      Text(
                        "پلاک خوان",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "تعداد کاربران مجاز:"),
                      Text(
                        "1",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "نوع سیستم عامل:"),
                      Text(
                        "Microsoft Windows",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "تاریخ انتشار:"),
                      Text(
                        "1403/10/29",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FutursOfSystemRow(lable: "ساخته شده توسط:"),
                      Text(
                        "امن آفرینان دانش پژوه",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'aial'),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FutursOfSystemRow extends StatelessWidget {
  String lable;

  FutursOfSystemRow({required this.lable});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: Text(
        lable,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
