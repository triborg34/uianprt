import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';

class PortSettings extends StatelessWidget {
  PortSettings({super.key});
  TextEditingController portController = TextEditingController(text: Get.find<settingController>().port);
  TextEditingController connectConttroler=TextEditingController(text: Get.find<settingController>().connect);

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
                    SizedBox(height: 10,),

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
