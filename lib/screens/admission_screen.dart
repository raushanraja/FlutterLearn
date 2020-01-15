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
  String village="V";
  String ward="W";
  String category="C";
  String dob="12-10-1997";
  String minority="0";
  String divyang="1";
  String aadharNo="1212";
  String mobileNo="4545";
  String ifscCode="8848";
  String bankAccountNo="sdfsd8";
  String bankAccountName="s8888d/d/d/";
  String annualIncome="99998898";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admission"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async{
          print("Adding Data");
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "admissionNo"
              ),
              onChanged: (value){
                admissionNo=value;
              },
            ),
             TextField(
              decoration: InputDecoration(
                hintText: "admissionDate"
              ),
              onChanged: (value){
                admissionDate = value;
              },
            ),
             TextField(
              decoration: InputDecoration(
                hintText: "studentName"
              ),
              onChanged: (value){
                studentName = value;
              },
            ),
             TextField(
              decoration: InputDecoration(
                hintText: "fatherName"
              ),
              onChanged: (value){
                fatherName = value;
              },
            ), TextField(
              decoration: InputDecoration(
                hintText: "motherName"
              ),
              onChanged: (value){
                motherName = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
