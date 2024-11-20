import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uianprt/model/consts.dart';

class CameraSetting extends StatelessWidget {
  List myset = [{
    "id": 0,
    "Name": "AmnAfarin",
    "Rtsp": "192.168.1.189:554/mainstream",
    "Licanse": "aslkjdfaslkhjfdaslkdhkjlas",
    "Entrance": "ورود",
    "Status": 1
  },{
        "id": 1,
    "Name": "AmnAfarin",
    "Rtsp": "192.168.1.190:554/mainstream",
    "Licanse": "aslkjdfaslkhjfdaslkthkjlas",
    "Entrance": "خروج",
    "Status": 0
  },
  ];
  CameraSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
             padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white70)),
                    color: purpule, borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))),
            child: Row(textDirection: TextDirection.rtl,
               mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CameraSettingRows(title: 'ردیف',),
                VerticalDivider(),
                CameraSettingRows(title: 'اسم دوربین',),
                VerticalDivider(),
                CameraSettingRows(title: 'ادرس دوربین',),
                VerticalDivider(),
                CameraSettingRows(title: 'لایسنس',),
                VerticalDivider(),
                CameraSettingRows(title: 'ورودی/خروجی',),
                VerticalDivider(),
                       Container(
        width:  150 ,
        child: Center(
          child: Text(
           "وضعیت" .toString(),
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        )),
                VerticalDivider(),
                     Container(
                      width: 70,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                            "اتصال مجدد",style: TextStyle(color: Colors.white70,fontSize: 12),),
                      ),
                    ),
                            Container(
                      width: 70,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                            "ویرایش",style: TextStyle(color: Colors.white70,fontSize: 12),),
                      ),
                    ),
                                      Container(
                      width: 60,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                            "حذف",style: TextStyle(color: Colors.white70,fontSize: 12),),
                      ),
                    )


        
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: purpule, ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CameraSettingRows(title: myset[index]["id"]),
                    VerticalDivider(),
                    CameraSettingRows(title: myset[index]["Name"]),
                    VerticalDivider(),
                    CameraSettingRows(title: myset[index]["Rtsp"].split(':')[0]),
                    VerticalDivider(),
                    CameraSettingRows(title: myset[index]["Licanse"]),
                    VerticalDivider(),
                    CameraSettingRows(title: myset[index]["Entrance"]),
                    VerticalDivider(),
                    myset[index]["Status"] == 1
                        ? Container(
                            width: 150,
                            child: Center(
                                child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 32,
                            )))
                        : Container(
                            width: 150,
                            child: Center(
                                child: Icon(
                              Icons.dangerous,
                              color: Colors.red,
                              size: 32,
                            ))),
                    VerticalDivider(),
                    Container(
                      width: 50,
                      color: Colors.transparent,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.repeat,
                              color: Colors.white70,
                            )),
                      ),
                    ),SizedBox(width: 25,),
                    Container(
                      width: 50,
                      color: Colors.transparent,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.white70,
                            )),
                      ),
                    ),SizedBox(width: 25,),
                    Container(
                      width: 50,
                      color: Colors.transparent,
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.red,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: myset.length,
              separatorBuilder: (context, index) => Divider(thickness: 0,height: 0,),
            ),
          ),
        ],
      ),
    );
  }
}

class CameraSettingRows extends StatelessWidget {
  CameraSettingRows({
    super.key,
    required this.title,
  });

  var title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width:  240 ,
        child: Center(
          child: Text(
            title.toString(),
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
