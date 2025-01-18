import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';



class Infoscreen extends StatelessWidget {
  const Infoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(border: Border.all(color: purpule),borderRadius: BorderRadius.circular(10)),
            child: Column(textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               KeyValueRow(keyString: "BuilDNumber", valueString: "SN/1403001002"),Divider(color: purpule,),
               KeyValueRow(keyString: "UpdateNo", valueString: "14031029"),Divider(color: purpule,),
               KeyValueRow(keyString: "Last Update", valueString: "${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}"),Divider(color: purpule),
                 KeyValueRow(keyString: "Train Model Serial", valueString: "YOLOV5M100100"),Divider(color: purpule,),
               SizedBox(height: 0,),
              
               SizedBox(height: 40,width: 200,child: ElevatedButton(onPressed: (){

               }, child: Center(child: Text("Check For Upadte",style: TextStyle(fontSize: 14),)))),
              

              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(15),
          //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          //   width: Get.width,
          //   decoration: BoxDecoration(
          //       color: purpule, borderRadius: BorderRadius.circular(15)),
          //   // child: Directionality(
          //   //   textDirection: TextDirection.rtl,
          //   //   child: Column(
          //   //     children: [
          //   //       SizedBox(height: 15,),
          //   //       KeyValueRow(
          //   //         keyString: "ورژن برنامه",
          //   //         valueString: "0.1",
          //   //       ),SizedBox(height: 15,),Divider(color: Colors.white24,),SizedBox(height: 15,),
          //   //           KeyValueRow(
          //   //         keyString: "سال تولید",
          //   //         valueString: "1403",
          //   //       ),SizedBox(height: 15,),Divider(color: Colors.white24,)
          //   //       ,
          //   //       SizedBox(height: 15,),
          //   //           KeyValueRow(
          //   //         keyString: "تلفن پشتیبانی",
          //   //         valueString: "09163045801",
          //   //       ),
          //   //       SizedBox(height: 15,),
          //   //       Divider(color: Colors.white24,),
          //   //       KeyValueRow(keyString: "وبسایت", valueString: "https://amnafarinan.ir".toUpperCase()),
          //   //       SizedBox(height: 15,),

          //   //     ],
          //   //   ),
          //   // ),
          // ),

          Spacer(),
          Center(
            child: Text(
              "تمامی حقوق محفوظ به شرکت امن آفرین میباشد",
              style: TextStyle(color: Colors.white),
            ),
          )
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
        Container(
          color: Colors.transparent,
          width: 150,
          child: Text(
            keyString+" : ",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'arial'),
          ),
        ),
        

    
        Text(
          "  "+valueString,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "arial"),
        )
      ],
    );
  }
}
