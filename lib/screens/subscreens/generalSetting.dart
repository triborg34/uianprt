import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';

import 'package:timezone_utc_offset/timezone_utc_offset.dart';

class Generalsetting extends StatelessWidget {
  const Generalsetting({super.key});

  // Get a list of available timezones


  @override
  Widget build(BuildContext context) {
  

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
                height: 125,
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 125,
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
                  ],
                ),
              )),
            ],
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
            padding:  EdgeInsets.all(10),
            child: Row(
              children: [
                FutursOfSystemRow(lable: "منطقه زمانی : "),
                DropdownMenu(
                  width: 210,
                    initialSelection: Get.find<settingController>().timezoneseleted,
                    textStyle: TextStyle(color: Colors.white, fontFamily: 'arial'),
                   
                    dropdownMenuEntries: [
                      for (var timezone in Get.find<Boxes>().allTimeZones)
                        DropdownMenuEntry(
                            style: ButtonStyle(
                                textStyle: WidgetStatePropertyAll(
                                    TextStyle(fontFamily: 'arial'))),
                            value: timezone,
                            label:
                                "${timezone.split('/')[1]} : UTC(${getTimezoneUTCOffset(timezone).toString().contains('-') ? '' : "+"}${(getTimezoneUTCOffset(timezone)!.inMinutes / 60).toString().replaceFirst('.', ':')})")
                    ]),
                    SizedBox(width: 220,),
                    FutursOfSystemRow(lable: "نوع قالب"),
                    DropdownMenu(initialSelection: 24,enableSearch: false,enableFilter: false,textStyle: TextStyle(color: Colors.white),dropdownMenuEntries: [DropdownMenuEntry(value: 24, label: "24 ساعت"),DropdownMenuEntry(value: 12, label: "12 ساعت")])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FutursOfSystemRow extends StatelessWidget {
  String lable;
  TextEditingController controller = TextEditingController();
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
