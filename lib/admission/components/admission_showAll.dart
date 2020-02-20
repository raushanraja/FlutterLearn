import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_db/database/admission_db.dart';

class ShowAllAdmissions extends StatefulWidget {
  @override
  _ShowAllAdmissionsState createState() => _ShowAllAdmissionsState();
}

class _ShowAllAdmissionsState extends State<ShowAllAdmissions> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<MyDatabase>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 60,
          title: Text("Admission Form")),
      body: Container(
        child: Column(
          children: <Widget>[FutureBuilder(
            future: database.allData,
            builder: (context,snapshot){
              final studnets=snapshot.data ?? List();
              return(
               Column(
                 children: <Widget>[
                   Text(studnets[0].name),
                   Text(studnets[0].id.toString()),
                  Text(studnets[1].name),
                   Text(studnets[1].id.toString()),

                 ],
               )
              );
            },
          )],
        ),
      ),
    );
  }
}


Widget _buildListItem(Student itemTask, MyDatabase database) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.5),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 0, color: Colors.white24))),
                child: Icon(Icons.airline_seat_recline_normal,
                    color: Colors.white),
              ),
              title: Text(
                itemTask.id.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
             
             
              
            ),
          ),
        )
      ],
    );
  }