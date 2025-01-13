import 'package:get/get.dart';
import 'package:uianprt/controller/mianController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(videoController());
    Get.put(tableController());
    Get.lazyPut(()=>feildController());
    Get.put(Boxes());
    Get.put(ReportController());
    Get.put(navController());
    Get.lazyPut(() => settingController(),);
    Get.put(ViedoSocket());

  }

}