import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class GeminidbHelper {
  GeminidbHelper._();
  static GeminidbHelper instanse = GeminidbHelper._();

  Database? db;

  final String dbname = "data.db";

  cheackdata() async {
    if (db != null) {
      return db!;
    } else {
      return await initdb();
    }
  }

  Future<Database> initdb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
    return await openDatabase(
      path,
      version: 1,
    );
  }

  insertdata() {}
  readdata() {}
  deletedata() {}
}
