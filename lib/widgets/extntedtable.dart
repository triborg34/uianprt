import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/widgets/licancenumber.dart';
import  'package:persian_number_utility/persian_number_utility.dart';

Container contant() {
  return Container(
      height: 48,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: GetBuilder<tableController>(
        builder: (tcontroller) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [
            // contactOfTable(tcontroller.selectedIndex == -1
            //     ? "-"
            //     : convertToPersianString(
            //         tcontroller.selectedmodel.plateNum!,
            //         alphabetP2)),
            tcontroller.selectedIndex == -1
                ? headerOftable('-')
                : Container(
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: purpule))),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 205,
                    height: 48,
                    child: LicanceNumber(entry: tcontroller.selectedmodel)),
            tcontroller.selectedIndex == -1
                ? headerOftable('-')
                : Container(
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: purpule))),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 205,
                    child: Center(
                      child: Image.asset(tcontroller.selectedmodel.imgpath!.replaceFirst('D:/Programins/Codes/uianprt/', '')),
                    ),
                  ),
            contactOfTable(Get.find<Boxes>()
                    .regBox
                    .where(
                      (element) =>
                          element.plateNumber ==
                          tcontroller.selectedmodel.plateNum,
                    )
                    .isEmpty
                ? "-"
                : Get.find<Boxes>()
                    .regBox[Get.find<Boxes>().regBox.indexWhere(
                          (element) =>
                              element.plateNumber ==
                              tcontroller.selectedmodel.plateNum,
                        )]
                    .name!),
           contactOfTable(Get.find<Boxes>()
                    .regBox
                    .where(
                      (element) =>
                          element.plateNumber ==
                          tcontroller.selectedmodel.plateNum,
                    )
                    .isEmpty
                ? "-"
                : Get.find<Boxes>()
                    .regBox[Get.find<Boxes>().regBox.indexWhere(
                          (element) =>
                              element.plateNumber ==
                              tcontroller.selectedmodel.plateNum,
                        )]
                    .carName!),
            contactOfTable(tcontroller.selectedIndex == -1
                ? "-"
                : tcontroller.selectedmodel.eDate!.toPersianDate()),
            contactOfTable(tcontroller.selectedIndex == -1
                ? "-"
                : tcontroller.selectedmodel.eTime!)
          ],
        ),
      ));
}

Container header() {
  return Container(
    alignment: Alignment.center,
    height: 50,
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: purpule))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.rtl,
      children: [
        headerOftable("شماره پلاک"),
        headerOftable("عکس پلاک"),
        headerOftable(" نام و نام خانوادگی"),
        headerOftable("نوع ماشین"),
        headerOftable("تاریخ ورود"),
        headerOftable("ساعت ورود")
      ],
    ),
  );
}

Container headerOftable(String title) {
  return Container(
      decoration:
          BoxDecoration(border: Border(left: BorderSide(color: purpule))),
      height: 50,
      width: 205,
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Colors.white),
      )));
}

Container contactOfTable(String title) {
  return Container(
      decoration:
          BoxDecoration(border: Border(left: BorderSide(color: purpule))),
      height: 98,
      width: 205,
      child: Center(
          child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white, fontSize: 18),
      )));
}
