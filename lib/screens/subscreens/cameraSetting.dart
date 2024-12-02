
// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/storagedb/cameras.dart';
import 'package:uianprt/widgets/videogetter.dart';


class CameraSetting extends StatelessWidget {
  CameraSetting({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.find<Boxes>().camerabox.length);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white70)),
                color: purpule,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CameraSettingRows(
                  title: 'ردیف',
                ),
                VerticalDivider(),
                CameraSettingRows(
                  title: 'اسم دوربین',
                ),
                VerticalDivider(),
                CameraSettingRows(
                  title: 'ادرس دوربین',
                ),
                VerticalDivider(),
                CameraSettingRows(
                  title: 'لایسنس',
                ),
                VerticalDivider(),
                CameraSettingRows(
                  title: 'ورودی/خروجی',
                ),
                VerticalDivider(),
                Container(
                    width: 150,
                    child: Center(
                      child: Text(
                        "وضعیت".toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
                VerticalDivider(),
                Container(
                  width: 70,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "اتصال مجدد",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "ویرایش",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "حذف",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
          GetBuilder<Boxes>(
            id: 5,
            builder: (controller) {
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: purpule,
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CameraSettingRows(title: index),
                        VerticalDivider(),
                        CameraSettingRows(
                            title: controller.camerabox.values
                                .toList()[index]
                                .nameCamera),
                        VerticalDivider(),
                        CameraSettingRows(
                            title:
                                controller.camerabox.values.toList()[index].ip),
                        VerticalDivider(),
                        CameraSettingRows(
                            title: controller.camerabox.values
                                .toList()[index]
                                .licance),
                        VerticalDivider(),
                        CameraSettingRows(
                            title: controller.camerabox.values
                                        .toList()[index]
                                        .gate ==
                                    "exit"
                                ? "خروج"
                                : Get.find<Boxes>()
                                    .camerabox
                                    .values
                                    .toList()[index]
                                    .gate!
                                    .replaceFirst('entrance', 'ورود')),
                        VerticalDivider(),
                        controller.camerabox.values.toList()[index].status ==
                                true
                            ? Container(
                                width: 150,
                                child: Center(
                                    child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 32,
                                )))
                            : Container(
                                width: 150,
                                child: Center(
                                    child: Icon(
                                  Icons.dangerous,
                                  color: Colors.red,
                                  size: 32,
                                ))),
                        VerticalDivider(),
                        Container(
                          width: 50,
                          color: Colors.transparent,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  WebSocket webSocket =
                                      WebSocket("ws://127.0.0.1:5000");
                                  webSocket.connect();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.repeat,
                                  color: Colors.white70,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 50,
                          color: Colors.transparent,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final TextEditingController
                                          nameController =
                                          TextEditingController(
                                              text: controller.camerabox.values
                                                  .toList()[index]
                                                  .nameCamera);
                                      final TextEditingController ipController =
                                          TextEditingController(
                                              text: controller.camerabox.values
                                                  .toList()[index]
                                                  .ip);
                                      String cameraType = controller
                                          .camerabox.values
                                          .toList()[index]
                                          .gate!; // Default value

                                      return AlertDialog(
                                        title: const Text('اضافه کردن دوربین'),
                                        content: SingleChildScrollView(
                                          child: StatefulBuilder(
                                            builder: (BuildContext context,
                                                StateSetter setState) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  // Using TextFormField instead of TextField for better Windows compatibility
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontFamily: 'arial'),
                                                    controller: nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'اسم دوربین',
                                                      hintText:
                                                          'اسم دوربین را وارد کنید',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    // Enable keyboard handling for Windows
                                                    keyboardType:
                                                        TextInputType.text,
                                                    autofocus: true,
                                                  ),
                                                  const SizedBox(height: 16),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        fontFamily: 'arial'),
                                                    controller: ipController,
                                                    decoration: InputDecoration(
                                                      labelText: 'آدرس دوربین',
                                                      hintText:
                                                          'e.g:192.168.1.1',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    // Enable keyboard handling for Windows
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                  const SizedBox(height: 16),
                                                  // Using DropdownButton instead of Radio for better Windows experience
                                                  DropdownButtonFormField<
                                                      String>(
                                                    value: cameraType,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'نوع دوربین',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    items: const [
                                                      DropdownMenuItem(
                                                        value: 'entrance',
                                                        child: Text('ورود'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: 'exit',
                                                        child: Text('خروج'),
                                                      ),
                                                    ],
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        cameraType = newValue!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              nameController.dispose();
                                              ipController.dispose();
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('خروج'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              final cameraData = {
                                                'name': nameController.text,
                                                'ip': ipController.text,
                                                'type': cameraType,
                                              };

                                              nameController.dispose();
                                              ipController.dispose();
                                              Navigator.of(context)
                                                  .pop(cameraData);
                                            },
                                            child: const Text('ثبت'),
                                          ),
                                        ],
                                      );
                                    },
                                  ).then((value) async {
                                    if (value != null) {
                                      // Handle the camera data
                                      print('Camera Patched: $value');
                                      await Get.find<Boxes>().camerabox.putAt(
                                          index,
                                          Cameras(
                                              id: controller.camerabox.values
                                                  .toList()[index]
                                                  .id,
                                              gate: value['type'],
                                              ip: value['ip'],
                                              nameCamera: value['name'],
                                              status: true,
                                              username: "",
                                              password: "",
                                              licance: controller
                                                  .camerabox.values
                                                  .toList()[index]
                                                  .licance));
                                    }
                                    Get.find<Boxes>().update([5]);
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.edit,
                                  color: Colors.white70,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 50,
                          color: Colors.transparent,
                          child: Center(
                            child: IconButton(
                                onPressed: () async {
                                  await controller.camerabox.deleteAt(index);
                                  Get.find<Boxes>().update([5]);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: controller.camerabox.length,
                  separatorBuilder: (context, index) => Divider(
                    thickness: 0,
                    height: 0,
                  ),
                ),
              );
            },
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
// Button to show dialog
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      final TextEditingController nameController =
                          TextEditingController();
                      final TextEditingController ipController =
                          TextEditingController();
                      final TextEditingController username=TextEditingController();
                      final TextEditingController password=TextEditingController();
                      String cameraType = 'entrance'; // Default value

                      return AlertDialog(
                        title: const Text('اضافه کردن دوربین'),
                        content: SingleChildScrollView(
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Using TextFormField instead of TextField for better Windows compatibility
                                  TextFormField(
                                    style: TextStyle(fontFamily: 'arial'),
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      labelText: 'اسم دوربین',
                                      hintText: 'اسم دوربین را وارد کنید',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Enable keyboard handling for Windows
                                    keyboardType: TextInputType.text,
                                    autofocus: true,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    style: TextStyle(fontFamily: 'arial'),
                                    controller: ipController,
                                    decoration: InputDecoration(
                                      labelText: 'آدرس دوربین',
                                      hintText: 'e.g:192.168.1.1',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Enable keyboard handling for Windows
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 16),
                                    TextFormField(
                                    style: TextStyle(fontFamily: 'arial'),
                                    controller: username,
                                    decoration: InputDecoration(
                                      labelText: 'نام کاربری',
                                      hintText: 'e.g:admin',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Enable keyboard handling for Windows
                                    keyboardType: TextInputType.text,
                                  ),const SizedBox(height: 16),
                                    TextFormField(
                                    style: TextStyle(fontFamily: 'arial'),
                                    controller: password,
                                    decoration: InputDecoration(
                                      labelText: 'کلمه عبور',
                                      hintText: 'e.g:admin',
                                      border: OutlineInputBorder(),
                                    ),
                                    // Enable keyboard handling for Windows
                                    keyboardType: TextInputType.text,
                                  ),const SizedBox(height: 16),
                                  // Using DropdownButton instead of Radio for better Windows experience,
                                  DropdownButtonFormField<String>(
                                    value: cameraType,
                                    decoration: const InputDecoration(
                                      labelText: 'نوع دوربین',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'entrance',
                                        child: Text('ورود'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'exit',
                                        child: Text('خروج'),
                                      ),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        cameraType = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              nameController.dispose();
                              ipController.dispose();
                              Navigator.of(context).pop();
                            },
                            child: const Text('خروج'),
                          ),
                          TextButton(
                            onPressed: () {
                              final cameraData = {
                                'name': nameController.text,
                                'ip': ipController.text,
                                'type': cameraType,
                                'username':username.text,
                                'password':password.text
                              };

                              nameController.dispose();
                              ipController.dispose();
                              username.dispose();
                              password.dispose();
                              Navigator.of(context).pop(cameraData);
                            },
                            child: const Text('ثبت'),
                          ),
                        ],
                      );
                    },
                  ).then((value) async {
                    if (value != null) {
                      // Handle the camera data
                      print('Camera added: $value');
                      await Get.find<Boxes>().camerabox.add(Cameras(
                          id: Random().nextInt(9999),
                          gate: value['type'],
                          ip: value['ip'],
                          nameCamera: value['name'],
                          status: true,
                          username: value['username'],
                          password: value['password'],
                          licance: generateRandomString(100)));
                    }
                    Get.find<Boxes>().update([5]);
                  });
                },
                child: Row(
                  children: [
                    Text('اضافه کردن'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.add_circle),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  var dio = Dio();
                  //TODO:Save is Completed , Delete ?? chtgpt
                  print(Get.find<Boxes>().camerabox.values.first.ip);
                  var res = dio.post('http://127.0.0.1:8000/cameras', data: {
                    "ip": "${Get.find<Boxes>().camerabox.values.first.ip}",
                    "username":"${Get.find<Boxes>().camerabox.values.first.username}",
                    "password":"${Get.find<Boxes>().camerabox.values.first.password}"
                    
                  }).then(
                    (value) {
                      print({   "username":"${Get.find<Boxes>().camerabox.values.first.username}",
                    "password":"${Get.find<Boxes>().camerabox.values.first.password}"});
                      if (value.statusCode == 200) {
                        Get.snackbar(
                          "",
                          '',
                          colorText: Colors.white,
                          messageText: Text(
                            "تنظیمات ذخیره شد",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'arial'),
                          ),
                        );
                      }
                    },
                  );
                },
                child: Row(
                  children: [
                    Text("ذخیره"),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.save_as),
                  ],
                ),
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}

class CameraSettingRows extends StatelessWidget {
  CameraSettingRows({
    super.key,
    required this.title,
  });

  var title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        child: Center(
          child: Text(
            title.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
