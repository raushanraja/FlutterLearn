import 'package:flutter/material.dart';

class AdmissionScreen extends StatefulWidget {
  @override
  _AdmissionScreenState createState() => _AdmissionScreenState();
}

class _AdmissionScreenState extends State<AdmissionScreen> {

  int id;
  String admissionNo;
  String admissionDate;
  String studentName;
  String fatherName;
  String motherName;
  String gender;
  String village;
  String ward;
  String category;
  String dob;
  String minority;
  String divyang;
  String aadharNo;
  String mobileNo;
  String ifscCode;
  String bankAccountNo;
  String bankAccountName;
  String annualIncome;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admission"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value){
                id=int.tryParse(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
