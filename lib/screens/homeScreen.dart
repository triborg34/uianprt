import 'package:flutter/material.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/widgets/dbContant.dart';
import 'package:uianprt/widgets/extendetTableData.dart';
import 'package:uianprt/widgets/newvideogetter.dart';
import 'package:uianprt/widgets/tableTitle.dart';

class HomeScreen extends StatelessWidget {
  
   HomeScreen({
    super.key,
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;
  int gridselector=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  TableTitle(),
                  DbContant(databaseHelper: _databaseHelper)
                ],
              )),
              // VideoRtsp(context),
              StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                  children: [
                    VidGridBuild(gridselector, context),
                    Row(
                      children: [
                          IconButton(
                            onPressed: () {
                            setState(() {
                                gridselector=0;
                            },);
                            },
                            icon: Icon(Icons.rectangle_outlined)),
                          IconButton(
                            onPressed: () {
                            setState(() {
                                gridselector=1;
                            },);
                            },
                            icon: Icon(Icons.grid_view)),
                        IconButton(
                            onPressed: () {
                            setState(() {
                                gridselector=2;
                            },);
                            },
                            icon: Icon(Icons.grid_on))
                      ],
                    )
                  ],
                );
                },
                
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ExtendetTableData(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget VidGridBuild(int index, context) {
    print((MediaQuery.sizeOf(context).width * 0.5)/2);
    if (index == 0) {
      return VideoStream(url: "ws://127.0.0.1:5000/rt1",);
    } else if(index==1){
      return Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: 350,
        child: Wrap(
          children: [
            for (int i = 1; i <= 4; i++)
              Container(
                width: ((MediaQuery.sizeOf(context).width * 0.5)/2)-10,
                height: 350*0.5,
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                color: Colors.transparent,
                child: VideoStream(url: "ws://127.0.0.1:5000/rt${i}",),
              )

          ],
        ),
      );
    }
    else {
      return Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: 350,
        child: Wrap(
          children: [
            for (int i = 1; i <= 9; i++)
              Container(
                width: ((MediaQuery.sizeOf(context).width * 0.5)/3)-10,
                height: 350/3,
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                color: Colors.transparent,
                child: VideoStream(url: "ws://127.0.0.1:5000/rt${i}",),
              )

          ],
        ),
      );
    }
  }
}
