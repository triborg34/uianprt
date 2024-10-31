import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                height: 120,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutursOfSystemRow(lable: "آستانه تشخیص پلاک:",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "آستانه تشخیص حروف:",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "کیفیت تصویر نظارت",),

                    
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 120,
                color: Colors.transparent,
                child: Column(
                  children: [
                        FutursOfSystemRow(lable: "تشخیص پلاک مجدد بعد از:",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "بررسی برای بهترین پلاک:",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "رد کردن فریم",),
                  ],
                ),
              )),
                            Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 120,
                color: Colors.transparent,
                child: Column(
                  children: [
                        FutursOfSystemRow(lable: "سخت افزار مورد استفاده ",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "خروج خودکار بعد از:",),
                    SizedBox(height: 15,),
                    FutursOfSystemRow(lable: "بیشینه مجاز همزمان مجاز",),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

class FutursOfSystemRow extends StatelessWidget {
  String lable;
    TextEditingController controller=TextEditingController();
    FutursOfSystemRow({  required this.lable });
  @override
  Widget build(BuildContext context) {
    int templeng=23-(lable.length+1);
    
    String  space="*"*templeng;
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          lable.length<23 ? "${space}${lable}" : lable
         ,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: purpule,
              borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          height: 30,
          width: 200,
          child: TextField(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              showCursor: true,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              cursorColor: Colors.white,
              cursorHeight: 15,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none)),
              controller: controller),
        )
      ],
    );
  }
}
