import 'package:sqflite/sqflite.dart';

class Attandance {
  final int id;
  final String admissionNo;
  final String admissionDate;
  final String studentName;
  final String fatherName;
  final String motherName;
  final String gender;
  final String village;
  final String ward;
  final String category;
  final String dob;
  final String minority;
  final String divyang;
  final String aadharNo;
  final String mobileNo;
  final String ifscCode;
  final String bankAccountNo;
  final String bankAccountName;
  final String annualIncome;

  Attandance(
      {this.id,
      this.admissionNo,
      this.admissionDate,
      this.studentName,
      this.fatherName,
      this.motherName,
      this.gender,
      this.village,
      this.ward,
      this.category,
      this.dob,
      this.minority,
      this.divyang,
      this.aadharNo,
      this.mobileNo,
      this.ifscCode,
      this.bankAccountNo,
      this.bankAccountName,
      this.annualIncome});

  Future createTable(String table, Database db) async {
    try {
      await db.execute(
          "CREATE TABLE Admission(id integer PRIMARY KEY, admissionNo varchar, studentName varchar, fatherName varchar, motherName varchar, gender varchar, village varchar, ward varchar, category varchar, dob varchar,  minority integer, divyang integer, aadharNo varchar, mobileNo varchar, ifscCode varchar, bankAccountNo varchar, bankAccountName varchar, annualIncome varchar)");
      print("Table $table created");
    } catch (e) {
      print("Error $e occured");
    }
  }

  Future insertData(String table, Database db) async {
    await createTable(table, db);
    try {
      await db.execute(
          "INSERT INTO Admission (id,admissionNo,admissionDate,studentName,fatherName,motherName,gender,village,ward,category,dob,minority,divyang,aadharNo,mobileNo,ifscCode,bankAccountNo,bankAccountName,annualIncome) VALUES($id,$admissionNo,$admissionDate,$studentName,$fatherName,$motherName,$gender,$village,$ward,$category,$dob,$minority,$divyang,$aadharNo,$mobileNo,$ifscCode,$bankAccountNo,$bankAccountName,$annualIncome})");
      print("data inserted");
      return 1;
    } catch (e) {
      print("Error $e occured");
    }
  }
}

// Future createTable(String table, Database db) async {
//   try {
//     await db.execute(
//         "CREATE TABLE $table(id integer PRIMARY KEY, admissionNo varchar, studentName varchar, fatherName varchar, motherName varchar, gender varchar, village varchar, ward varchar, category varchar, dob varchar,  minority integer, divyang integer, aadharNo varchar, mobileNo varchar, ifscCode varchar, bankAccountNo varchar, bankAccountName varchar, annualIncome varchar)");
//     print("Table $table created");
//   } catch (e) {
//     print("Error $e occured");
//   }
// }

// Future insertData(String table, Database db) async {
//   await createTable(table, db);
//   try {
//     await db.execute(
//         "INSERT INTO $table (id,admissionNo,admissionDate,studentName,fatherName,motherName,gender,village,ward,category,dob,minority,divyang,aadharNo,mobileNo,ifscCode,bankAccountNo,bankAccountName,annualIncome) VALUES($id,$admissionNo,$admissionDate,$studentName,$fatherName,$motherName,$gender,$village,$ward,$category,$dob,$minority,$divyang,$aadharNo,$mobileNo,$ifscCode,$bankAccountNo,$bankAccountName,$annualIncome})");
//     return 1;
//   } catch (e) {
//     print("Error $e occured");
//   }
// }
