import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';

class PortSettings extends StatelessWidget {
  PortSettings({super.key});
  TextEditingController portController =
      TextEditingController(text: Get.find<settingController>().port);
  TextEditingController connectConttroler =
      TextEditingController(text: Get.find<settingController>().connect);

  TextEditingController rfidip=TextEditingController(text: '192.168.1.91');
  TextEditingController rfidport=TextEditingController(text: '2000');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "سیستم",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ))),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 65,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            'پورت سوکت:',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: TextFormField(
                            controller: portController,
                            readOnly: false,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'arial'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'eg:8080',
                                hintTextDirection: TextDirection.ltr),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 65,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          'پورت اتصال:',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: TextFormField(
                          controller: connectConttroler,
                          readOnly: false,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'arial'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'eg:9090',
                              hintTextDirection: TextDirection.ltr),
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 65,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          'آدرس داخلی',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: TextFormField(
                          controller: TextEditingController(text: '127.0.0.1'),
                          readOnly: true,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.white70, fontFamily: 'arial'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'eg:8080',
                              hintTextDirection: TextDirection.ltr),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "اطلاعات سیستم",
                style: TextStyle(color: Colors.white),
              ))),
          SizedBox(
            height: 15,
          ),
          ipFunction("نام شبکه", ethname),
          SizedBox(
            height: 10,
          ),
          ipFunction("آدرس شبکه", ipadress),
          SizedBox(
            height: 10,
          ),
          ipFunction("نوع آدرس", ipname),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "رله و آلارم",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ))),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    "اتصال به رله",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Obx(() => Switch(
                      value: Get.find<settingController>().isRfid.value,
                      onChanged: (value) {
                        Get.find<settingController>().isRfid.value = value;
                        if(value==false){
                              String url='http://127.0.0.1:8000/iprelay?ip=${rfidip.text}&port=${rfidport.text}';
                            Dio dio=Dio();
                            dio.post(url,data: {"isconnect":false}).then((value) {
                              if(value.statusCode==200){
                                print(value.data['massage']);
                              }
                            },);
                        }
                      },
                    )),

                Obx(() => Visibility(
                      visible: Get.find<settingController>().isRfid.value,
                      child: Row(
                        children: [
                                          SizedBox(
                  width: 15,
                ),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                        controller: rfidip,
                        readOnly: false,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.white70, fontFamily: 'arial'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'eg:192.168.1.91',
                            hintTextDirection: TextDirection.ltr))),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                        controller:rfidport,
                        readOnly: false,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.white70, fontFamily: 'arial'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'eg:2000',
                            hintTextDirection: TextDirection.ltr))),
                SizedBox(
                  width: 15,
                ),
                Text("رله یک",style: TextStyle(color: Colors.white),),
                Obx(() => Checkbox(
                      value: Get.find<settingController>().rl1.value,
                      onChanged: (value) {
                        Get.find<settingController>().rl1.value = value!;
                      },
                    )),
                SizedBox(
                  width: 15,
                ),
                Text("رله دو",style: TextStyle(color: Colors.white),),
                Obx(() => Checkbox(
                      value: Get.find<settingController>().rl2.value,
                      onChanged: (value) {
                        Get.find<settingController>().rl2.value = value!;
                      },
                    )),
                          TextButton(
                              onPressed: () {
                               String url='http://127.0.0.1:8000/iprelay?ip=${rfidip.text}&port=${rfidport.text}';
                                Dio dio=Dio();
                                dio.post(url,data: {"isconnect":true}).then((value) {
                                  if(value.statusCode==200){
                                    print(value.data['massage']);
                                  }
                                },);
                              },
                              child: Text(
                                "اتصال",
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding ipFunction(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Container(
            width: 110,
            child: Text(
              "${label}:",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
