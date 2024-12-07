  import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';

AppBar MyAppBar() {
    return AppBar(
      
      foregroundColor: Colors.white,
      centerTitle: true,
      title:Image.asset('assets/images/logo.jpg'),
      backgroundColor: purpule,
      actions: [Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0),
        child: Text("Automatic License Plate Recognition",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
      )],
    );
  }



  