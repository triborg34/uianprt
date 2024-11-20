import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';

class CameraSetting extends StatelessWidget {
  Map myset = {
    "Camera Id": 0,
    "Name": "AmnAfarin",
    "Rtsp": "192.168.1.189:554/mainstream",
    "Licanse": "aslkjdfaslkhjfdaslkdhkjlas",
    "Entrance": "Entering",
    "Status": 0
  };
  CameraSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              color: purpule, borderRadius: BorderRadius.circular(10)),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                  child: Center(
                    child: Text(
                                    myset['Name'],
                                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                                  ),
                  )),
              VerticalDivider()
            ],
          ),
        ),
        itemCount: 1,
        separatorBuilder: (context, index) => SizedBox(),
      ),
    );
  }
}
