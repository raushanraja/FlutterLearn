import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Admission {
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
  static const attandanceSQL =
      "CREATE TABLE Admission(id integer PRIMARY KEY, admissionNo varchar, studentName varchar, fatherName varchar, motherName varchar, gender varchar, village varchar, ward varchar, category varchar, dob varchar,  minority integer, divyang integer, aadharNo varchar, mobileNo varchar, ifscCode varchar, bankAccountNo varchar, bankAccountName varchar, annualIncome varchar)";
  Admission({
    @required this.id,
    @required this.admissionNo,
    @required this.admissionDate,
    @required this.studentName,
    @required this.fatherName,
    @required this.motherName,
    @required this.gender,
    @required this.village,
    @required this.ward,
    @required this.category,
    @required this.dob,
    @required this.minority,
    @required this.divyang,
    @required this.aadharNo,
    @required this.mobileNo,
    @required this.ifscCode,
    @required this.bankAccountNo,
    @required this.bankAccountName,
    @required this.annualIncome,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "admissionNo": admissionNo,
      "admissionDate": admissionDate,
      "studentName": studentName,
      "fatherName": fatherName,
      "motherName": motherName,
      "gender": gender,
      "village": village,
      "ward": ward,
      "category": category,
      "dob": dob,
      "minority": minority,
      "divyang": divyang,
      "aadharNo": aadharNo,
      "mobileNo": mobileNo,
      "ifscCode": ifscCode,
      "bankAccountNo": bankAccountNo,
      "bankAccountName": bankAccountName,
      "annualIncome": annualIncome
    };
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
