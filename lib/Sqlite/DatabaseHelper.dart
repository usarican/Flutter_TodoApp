import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static const String databaseName = "todolist.db";

  static Future<Database> connectionDatabase() async {
    String databasePath = join(await getDatabasesPath(),databaseName);

    if(await databaseExists(databasePath)){
      print("DATABASE EXIST");

    }
    else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("DATABASE COPPIED");

    }
    return openDatabase(databasePath);
  }
}