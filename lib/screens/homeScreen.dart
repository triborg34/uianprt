import 'package:flutter/material.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/widgets/dbContant.dart';
import 'package:uianprt/widgets/extendetTableData.dart';
import 'package:uianprt/widgets/newvideogetter.dart';
import 'package:uianprt/widgets/tableTitle.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;

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
              VideoStream()
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ExtendetTableData(),
          SizedBox(height: 20,),

    
         
          
        ],
      ),
    );
  }
}

