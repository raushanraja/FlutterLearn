import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_db/constants.dart';

class DBHelper {
  static Database _db;
  static final DBHelper instance = DBHelper._();

  DBHelper._();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, kdb_name);
    _db = await openDatabase(path, version: 1);
    return _db;
  }
}

// class DBHelper {
//   static Database _db;

//   Future<Database> get db async {
//     if (_db != null) return _db;
//     _db = await initDb();
//     return _db;
//   }

//   //Creating a database with name test.dn in your directory
//   initDb() async {
//     String databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, kdb_name);
//     _db = await openDatabase(path, version: 1);
//     return _db;
//   }

//   // Retrieving employees from Employee Tables

// }
