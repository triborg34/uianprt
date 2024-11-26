import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class UserSetting extends StatelessWidget {
  UserSetting({super.key});
  List users = [
    {
      "id": 0,
      "username": "AmnAfarin",
      "accsess": "admin",
      "tbc1": "tbc1",
      "tbc2": "tbc2"
    },
    {
      "id": 1,
      "username": "Mousavi",
      "accsess": "Operator",
      "tbc1": "tbc1",
      "tbc2": "tbc2"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                  color: purpule, borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                "کاربران",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: purpule),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          UserRows(title: users[index]['id']),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(title: users[index]['username']),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(title: users[index]['accsess']),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(title: users[index]['tbc1']),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(title: users[index]['tbc1']),
                          VerticalDivider(
                            color: purpule,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: purpule,
                        height: 0,
                      ),
                  itemCount: users.length),
            ),
            Container(
                child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("${Get.find<Boxes>().regBox[0].plateImagePath}");
                    },
                    child: Row(
                      children: [Text("اضافه کردن")],
                    )),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [Text("ذخیره")],
                    ))
              ],
            )),
            SizedBox(
              height: 25,
            ),
            Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                    color: purpule, borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  "افراد ثبت شده",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ))),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: purpule),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          UserRows(
                              title: convertToPersianString(
                                  Get.find<Boxes>().regBox[index].plateNumber!,
                                  alphabetP2)),
                          VerticalDivider(
                            color: purpule,
                          ),
                          Container(
                            width: 240,
                            child: Center(
                              child: Image.file(
                                File(
                                    "${imagesPath}${Get.find<Boxes>().regBox[index].plateImagePath}"),
                                width: 240,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(title: Get.find<Boxes>().regBox[index].name),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(
                              title: Get.find<Boxes>().regBox[index].carName),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(
                              title: Get.find<Boxes>()
                                  .regBox[index]
                                  .eDate!
                                  .toPersianDate()),
                          VerticalDivider(
                            color: purpule,
                          ),
                          UserRows(
                              title: Get.find<Boxes>().regBox[index].eTime!),
                          VerticalDivider(
                            color: purpule,
                          ),
                          Get.find<Boxes>().regBox[index].status! ? Icon(Icons.check_box,color: Colors.lightGreenAccent,) :Icon(Icons.block,color: Colors.red,),
                            VerticalDivider(
                            color: purpule,
                          ),

                          IconButton(onPressed: (){}, icon: IconButton(onPressed: (){}, icon: Icon(Icons.edit))),SizedBox(width: 5,),
                           IconButton(onPressed: (){}, icon: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: Get.find<Boxes>().regBox.length),

            ),
             Container(
                child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                    //TODO:Addtinal Screen or popup screen for registrainon 
                    },
                    child: Row(
                      children: [Text("اضافه کردن")],
                    )),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      //TODO:we can handle saving prosess here
                    },
                    child: Row(
                      children: [Text("ذخیره")],
                    ))
              ],
            )),
          ],
        ));
  }
}

class UserRows extends StatelessWidget {
  UserRows({
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
