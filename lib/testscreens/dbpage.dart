import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/storagedb/db.dart';
import 'package:uianprt/model/model.dart';

class HomePage extends StatefulWidget {
  final String dbPath;

  HomePage(this.dbPath);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper _databaseHelper;
  Timer? _pollingTimer;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.withPath(widget.dbPath);

    // Initial query to populate data
    _databaseHelper.queryAndEmitEntries();
   

    // Set up a periodic timer to poll the database for changes
    _pollingTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      _databaseHelper.queryAndEmitEntries(); // Poll for changes every 5 seconds
    });
  }

  @override
  void dispose() {
    _pollingTimer?.cancel(); // Cancel the timer when the widget is disposed
    _databaseHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Example with Entries'),
      ),
      body: StreamBuilder<List<plateModel>>(
        stream: _databaseHelper
            .entryStream, // Listening to the stream of database changes
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final entries = snapshot.data!;
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(
                  entry.plateNum!.length > 7
                      ? convertToPersian(entry.plateNum!, alphabetP2)[0]
                      : "",
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plate Percent: ${entry.platePercent}%'),
                    Text('Char Percent: ${entry.charPercent}%'),
                    Text('Date: ${entry.eDate}'),
                    Text('Time: ${entry.eTime}'),
                    Text('Status: ${entry.status}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
