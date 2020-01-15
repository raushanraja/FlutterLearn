import 'package:sqflite/sqflite.dart';

class SchoolInfo {
  String name, principal, phone, district, block, state, dise;

  SchoolInfo({
    this.name,
    this.principal,
    this.phone,
    this.district,
    this.block,
    this.dise,
  });

  Future createTable(Database db) async {
    await db.execute(
        "Create TABLE IF NOT EXISTS SchoolInfo(diseCode varchar PRIMARY KEY,principal varchar,schoolName varchar,block varchar,pincode int,mobileNumber varchar)");
  }
}
