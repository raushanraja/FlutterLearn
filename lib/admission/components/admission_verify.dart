import 'package:flutter/material.dart';
import 'package:flutter_db/admission/components/admission_showAll.dart';
import 'package:flutter_db/database/admission_db.dart';
import 'package:provider/provider.dart';

class AdmissionVerify extends StatefulWidget {
  AdmissionVerify({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _AdmissionVerifyState createState() => _AdmissionVerifyState();
}

class _AdmissionVerifyState extends State<AdmissionVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 60,
          title: Text("Admission Form")),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
                child: Column(
              children: <Widget>[
                 Text(
                widget.name,
                style: TextStyle(color: Colors.white,fontSize:50),
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                iconSize:30,
                color: Colors.white,
                onPressed:(){
                  print("Button Pressed");
                  insertData(context);
                },
              ),
              RaisedButton(
                
              color: Colors.white,
                child: Text(
                  "See All data"
                  ,style: TextStyle(backgroundColor: Colors.white),
                ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowAllAdmissions()));
      },
              )

              ],
            )),
          )
        ],
      ),
    );
  }

    insertData(BuildContext context) async{
    final database = Provider.of<MyDatabase>(context);
    final newS = Student(name: widget.name);
    database.addStudent(newS);
    print("Inpud Done");
  }
}
