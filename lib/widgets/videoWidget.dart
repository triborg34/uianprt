import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:uianprt/controller/mianController.dart';
import 'package:uianprt/model/consts.dart';

Container VideoRtsp(BuildContext context) {
    
    return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        border: Border.all(color:purpule)),
                    padding: EdgeInsets.all(8.0),
                    height: 350,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: ClipRRect(borderRadius: BorderRadius.circular(15),
                      child: Video(
                          wakelock: true,
                          controls: (state) {
                            // ignore: invalid_use_of_protected_member
                            state.deactivate();
                            return Container();
                          },
                          aspectRatio: 16 / 9,
                          fit: BoxFit.fill,
                          controller: Get.find<videoController>().vController),
                    ));
  }
