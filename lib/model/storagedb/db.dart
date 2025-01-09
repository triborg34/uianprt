// ignore_for_file: unused_import

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // For desktop support
import "../model.dart"; // Import your class

List<plateModel> platemode = [];

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal(); // Default constructor

  Database? _database;
  late final String
      dbPath; // Using late ensures it will be initialized before usage

  // Constructor to receive the database path (use this for custom paths)
  DatabaseHelper.withPath(String path) {
    dbPath = path; // Initialize dbPath
    _initializeDatabaseFactory(); // Initialize the factory for desktop platforms
  }

  void _initializeDatabaseFactory() {
    // For desktop platforms, initialize the SQLite FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // Initialize or open the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Open the existing database using the path (desktop or mobile)
    return await openDatabase(dbPath);
  }


  // Fetch entries and convert them into 'as' class instances
  Future<List<plateModel>> getEntriesAsList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('entry'); // Fetch all entries
    for (var data in maps) {
      platemode.add(plateModel(
          charPercent: data['charPercent'],
          eDate: data['eDate'],
          eTime: data["eTime"],
          plateNum: data["plateNum"].contains('Taxi') ?data["plateNum"].replaceAll('Taxi','x') : data["plateNum"],
          platePercent: data["platePercent"],
          status: data["status"],
          imgpath: data["imgpath"],
          scrnPath: data["scrnpath"]));
    }
    // Convert each row into an 'as' class instance
    return List.generate(maps.length, (i) {
      return plateModel(
          charPercent: maps[i]['charPercent'],
          eDate: maps[i]['eDate'],
          eTime: maps[i]['eTime'],
          plateNum: maps[i]['plateNum'].contains('Taxi') ? maps[i]['plateNum'].replaceAll('Taxi','x') : maps[i]['plateNum'],
          platePercent: maps[i]['platePercent'],
          status: maps[i]['status'],
          imgpath: maps[i]['imgpath'],
          scrnPath: maps[i]['scrnpath']);
    });
  }

  // Insert a new entry record
  Future<void> insertEntry(
      {required int platePercent,
      required int charPercent,
      required String eDate,
      required String eTime,
      required String plateNum,
      required int status,
      required String imgpath,
      required String scrnpath}) async {
    final db = await database;
    await db.insert(
      'entries',
      {
        'platePercent': platePercent,
        'charPercent': charPercent,
        'eDate': eDate,
        'eTime': eTime,
        'plateNum': plateNum,
        'status': status,
        'imgpath': imgpath,
        'scrnpath': scrnpath
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // Emit new data after insertion
    queryAndEmitEntries();
  }

  // Emit data changes (live updates)
  final _controller = StreamController<List<plateModel>>.broadcast();
  Stream<List<plateModel>> get entryStream => _controller.stream;

  Future<void> queryAndEmitEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> entries = await db.query('entry');

    // Convert each row into an 'as' class instance and emit to the stream
    List<plateModel> entryList = List.generate(entries.length, (i) {
      return plateModel(
          charPercent: entries[i]['charPercent'],
          eDate: entries[i]['eDate'],
          eTime: entries[i]['eTime'],
          plateNum: entries[i]['plateNum'].contains('Taxi') ? entries[i]['plateNum'].replaceAll('Taxi' , 'x') :entries[i]['plateNum'],
          platePercent: entries[i]['platePercent'],
          status: entries[i]['status'],
          imgpath: entries[i]['imgpath'],
          scrnPath: entries[i]['scrnpath']);
    });
    _controller.sink.add(entryList); // Emit the data to the stream
  }

  // Close the stream controller
  void dispose() {
    _controller.close();
  }
}
