import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_bar_custom/side_bar_custom.dart';
import 'package:uianprt/model/consts.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SideBar( items: [
           SideBarItem(
             text: "داشبورد",
             icon: Icons.home,
             tooltipText: "Dashboard page",
           ),
           SideBarItem(
             text: "Add User",
             icon: Icons.add,
           ),
         ], children: const [
            Center(
              child: Text("Dashboard",style: TextStyle(color: Colors.white),),
            ),
            Center(
              child: Text("Add User",style: TextStyle(color: Colors.white),),
            ),
          ],config: SideBarConfig(
            backgroundColor: purpule,
            

        
        
           enablePageView: true,
         ),),
      ),
    );
  }
}



