import 'package:sqflite/sqflite.dart';

class DatabaseManage {
  final String tableName;
  final Database db;

  DatabaseManage({this.tableName, this.db});

  Future<String> createTable(String sql) async {
    try {
      await db.execute(sql);
      return "Table Created";
    } catch (e) {
      return "Error $e Occured";
    }
  }

  Future<int> insertData(Map<String, dynamic> values) async {
    try {
      int x = await db.insert(tableName, values);
      return x;
    } catch (e) {
      print("Error in inserting : $e");
    }
  }

  Future<List> getAllData(String sql) async {
    try {
      List data = await db.rawQuery(sql);
      return data;
    } catch (e) {
      print("Error occured at getAllData : $e");
    }
  }
}
