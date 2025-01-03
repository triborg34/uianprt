import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/model.dart';
import 'package:uianprt/model/storagedb/db.dart';

import 'package:uianprt/widgets/Register.dart';

import 'licancenumber.dart';

class DbContant extends StatelessWidget {
  const DbContant({
    super.key,
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: StreamBuilder<List<plateModel>>(
          stream: _databaseHelper.entryStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: purpule,
                ),
              );
            }
            final entries = snapshot.data!.reversed.toList();
            return ListView.separated(
                controller: ScrollController(
                  initialScrollOffset: 0.0,
                ),
                itemBuilder: (context, index) {
                  final entry = entries[index];

                  return InkWell(
                    onTap: () {
                      Get.find<tableController>().selectedIndex = index;
                      Get.find<tableController>().selectedmodel =
                          entries[index];
                      Get.find<tableController>().update();
                    },
                    child: Visibility(
                      visible:
                          convertToPersian(entry.plateNum!, alphabetP2)[0] !=
                              '-',
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: purpule,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            SizedBox(
                                width: 210, child: LicanceNumber(entry: entry)),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            Container(
                              height: 48,
                              child: Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.file(
                                  File("${imagesPath}${entry.imgpath}"),
                                  fit: BoxFit.fill,
                                  width: 235,
                                  height: 48,
                                ),
                              )),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                width: 225,
                                child: Get.find<Boxes>()
                                        .regBox
                                        .where(
                                          (element) =>
                                              element.plateNumber ==
                                              entry.plateNum,
                                        )
                                        .isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color.fromARGB(
                                                255, 36, 87, 37)),
                                        child: Center(
                                          child: Text(
                                            "ثبت شده است",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return EnhancedCarRegistrationDialog(
                                                entry: entry,
                                                isEditing: false,
                                                isRegister: false,
                                                index: index,
                                              );
                                            },
                                          );
                                        },
                                        hoverColor: const Color.fromARGB(
                                            255, 29, 14, 55),
                                        // onPressed: () {

                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       Get.find<feildController>().name.text='';
                                        //       Get.find<feildController>().Fname.text='';
                                        //       Get.find<feildController>().carName.text='';
                                        //       return Center(
                                        //           child: Container(
                                        //         padding: EdgeInsets.only(top: 20),
                                        //         height: 240,
                                        //         width: 450,
                                        //         decoration: BoxDecoration(
                                        //             color: purpule,
                                        //             borderRadius:
                                        //                 BorderRadius.circular(25),
                                        //             border: Border.all(
                                        //                 color: Colors
                                        //                     .deepPurpleAccent
                                        //                     .shade700)),
                                        //         child: Column(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.start,
                                        //           children: [
                                        //             Text(
                                        //               "ثبت ماشین",
                                        //               style: TextStyle(
                                        //                   color: Colors.white,
                                        //                   fontSize: 24,
                                        //                   fontWeight:
                                        //                       FontWeight.w800),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 20,
                                        //             ),
                                        //             Padding(
                                        //               padding: const EdgeInsets
                                        //                   .symmetric(
                                        //                   horizontal: 8.0),
                                        //               child: Row(
                                        //                 mainAxisAlignment:
                                        //                     MainAxisAlignment
                                        //                         .spaceAround,
                                        //                 children: [
                                        //                   Container(
                                        //                       height: 40,
                                        //                       width: 200,
                                        //                       child: Material(
                                        //                         child: MyTextField(
                                        //                             hint:
                                        //                                 "نام خودرو",
                                        //                             controller: Get
                                        //                                     .find<
                                        //                                         feildController>()
                                        //                                 .carName),
                                        //                       )),
                                        //                   Container(
                                        //                     height: 40,
                                        //                     width: 200,
                                        //                     child: LicanceNumber(
                                        //                         entry: entry),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 15,
                                        //             ),
                                        //             Padding(
                                        //               padding: const EdgeInsets
                                        //                   .symmetric(
                                        //                   horizontal: 10.0),
                                        //               child: Row(
                                        //                 mainAxisAlignment:
                                        //                     MainAxisAlignment
                                        //                         .spaceAround,
                                        //                 children: [
                                        //                   Container(
                                        //                     height: 40,
                                        //                     width: 200,
                                        //                     child: Material(
                                        //                       child: MyTextField(
                                        //                           hint:
                                        //                               " نام خانوادگی",
                                        //                           controller:
                                        //                               Get.find<
                                        //                                       feildController>()
                                        //                                   .name),
                                        //                     ),
                                        //                   ),
                                        //                   Container(
                                        //                     height: 40,
                                        //                     width: 195,
                                        //                     child: Material(
                                        //                       child: MyTextField(
                                        //                           hint: "نام",
                                        //                           controller:
                                        //                               Get.find<
                                        //                                       feildController>()
                                        //                                   .Fname),
                                        //                     ),
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 15,
                                        //             ),
                                        //             Container(
                                        //               width: 200,
                                        //               child: ElevatedButton(
                                        //                 onPressed: () {
                                        //                   RegistredDb
                                        //                       registredDb =
                                        //                       RegistredDb(
                                        //                         role: '',
                                        //                         socialNumber: '',
                                        //                           plateImagePath:
                                        //                               entry.imgpath,
                                        //                           plateNumber: entry
                                        //                               .plateNum,
                                        //                           carName: Get.find<
                                        //                                   feildController>()
                                        //                               .carName
                                        //                               .text,
                                        //                           name:
                                        //                               "${Get.find<feildController>().Fname.text} ${Get.find<feildController>().name.text} ",
                                        //                           status: true,
                                        //                           eDate:
                                        //                               entry.eDate,
                                        //                           eTime: entry
                                        //                               .eTime,
                                        //                               screenImg: entry.scrnPath);
                                        //                   Get.find<Boxes>()
                                        //                       .hivebox
                                        //                       .add(registredDb);
                                        //                   Get.find<Boxes>()
                                        //                       .getregData();
                                        //                   Get.snackbar(
                                        //                     "ثبت شد",
                                        //                     "",
                                        //                     colorText:
                                        //                         Colors.white,
                                        //                     maxWidth: 90,
                                        //                   );
                                        //                   Navigator.pop(context);
                                        //                 },
                                        //                 child: Text(
                                        //                   "ثبت",
                                        //                   style: TextStyle(
                                        //                       color: Colors.white,
                                        //                       fontSize: 18),
                                        //                 ),
                                        //                 style:
                                        //                     TextButton.styleFrom(
                                        //                         backgroundColor:
                                        //                             Colors.green[
                                        //                                 600]),
                                        //               ),
                                        //             )
                                        //           ],
                                        //         ),
                                        //       ));
                                        //     },
                                        //   );
                                        // },
                                        icon: Icon(Icons.add_box_outlined),
                                        color: Colors.white70,
                                        iconSize: 36,
                                      ),
                                height: 50,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            Expanded(
                                child: Center(
                                    child: Container(
                                      
                              child: Text(entry.plateNum!.contains('x')
                                  ? "تاکسی"
                                  : entry.plateNum!.contains('A')
                                      ? "دولتی"
                                      : "شخصی",style: TextStyle(color: Colors.white,fontSize: 18),),
                            )))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: entries.length);
          }),
    );
  }
}
