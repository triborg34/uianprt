import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uianprt/model/consts.dart';

class Infoscreen extends StatelessWidget {
  const Infoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            width: Get.width,
            decoration: BoxDecoration(
                color: purpule, borderRadius: BorderRadius.circular(15)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  KeyValueRow(
                    keyString: "ورژن برنامه",
                    valueString: "0.1",
                  ),SizedBox(height: 15,),Divider(color: Colors.white24,),SizedBox(height: 15,),
                      KeyValueRow(
                    keyString: "سال تولید",
                    valueString: "1403",
                  ),SizedBox(height: 15,),Divider(color: Colors.white24,)
                  ,
                  SizedBox(height: 15,),
                      KeyValueRow(
                    keyString: "تلفن پشتیبانی",
                    valueString: "09163045801",
                  ),
                  SizedBox(height: 15,),
                  Divider(color: Colors.white24,),
                  KeyValueRow(keyString: "وبسایت", valueString: "https://amnafarinan.ir".toUpperCase()),
                  SizedBox(height: 15,),
                  
                ],
              ),
            ),
          ),Spacer(),
          Center(child: Text("تمامی حقوق محفوظ به شرکت امن آفرین میباشد",style: TextStyle(color: Colors.white),),)
        ],
      ),
    );
  }
}

class KeyValueRow extends StatelessWidget {
  late String keyString;
  late String valueString;
  KeyValueRow({required this.keyString, required this.valueString});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          keyString,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          valueString,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
