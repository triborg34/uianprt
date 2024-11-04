import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';

class Generalsetting extends StatelessWidget {
  const Generalsetting({super.key});

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
                            initialSelection: Get.find<settingController>().hardWareValue,
                            enableSearch: false,
                            enableFilter: false,
                            width: 150,
                            enabled: true,
                            textAlign: TextAlign.center,
                            onSelected: (value) {
                              Get.find<settingController>().hardWareValue=value!;
                            },
                            
                        
                            textStyle: TextStyle(color: Colors.white,fontSize: 14),
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
