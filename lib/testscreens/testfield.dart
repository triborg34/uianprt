import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/model/model.dart';

// ignore: must_be_immutable
class TestField extends StatefulWidget {
  final String dbPath;

  TestField({required this.dbPath});
  @override
  State<TestField> createState() => _TestFieldState();
}

class _TestFieldState extends State<TestField> {
  DatabaseHelper? databaseHelper;

  @override
  void initState() {
    databaseHelper = DatabaseHelper.withPath(widget.dbPath);
    databaseHelper!.queryAndEmitEntries();

    super.initState();
  }

  @override
  void dispose() {
    databaseHelper!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(backgroundColor: Colors.red, onPressed: () {
            
          }),
      body: Center(
          child: Container(
              child: StreamBuilder<List<plateModel>>(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            var entry = snapshot.data!;
            var datas=entry.where((element) => element.status=='Active',).toList();
        

            
            return Text(
              convertToPersian(datas[0].plateNum!, alphabetP2)[0],
              textDirection: TextDirection.rtl,
              style: TextStyle(fontFamily: 'byekan'),
            );
          }
        },
        stream: databaseHelper!.entryStream,
      ))),
    );
  }
}
