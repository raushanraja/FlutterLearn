import 'package:flutter/material.dart';
import 'package:sqflite_db/db_helper.dart';
import 'package:sqflite_db/models/school_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dbhelper = DBHelper.instance;
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int id = 0;
  String name = "", address = "", email = "", phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Id"),
                      controller: idController,
                      onChanged: (value) {
                        setState(() {
                          id = int.tryParse(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Name"),
                      controller: nameController,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Address"),
                      controller: addressController,
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Email"),
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Phone"),
                      controller: phoneController,
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Text("Save"),
                    onPressed: () async {
                      var db = await dbhelper.db;
                      // _db.insert(
                      //   SchoolInfo(
                      //       id: id,
                      //       name: name,
                      //       address: address,
                      //       email: email,
                      //       phone: phone),
                      // );
                      var si = SchoolInfo(
                          name: name,
                          block: address,
                          district: address,
                          dise: id.toString(),
                          phone: phone,
                          principal: email);
                      dbhelper.db;
                      print("Inside Save");
                      await si.createTable(db);

                      // await db.execute(
                      // "INSERT INTO SchoolInfo(diseCode,principal,schoolName,block,pincode,mobileNumber) VALUES(${si.dise},${si.principal},${si.name},${si.block},111,${si.phone})");
                      var x = await db.rawQuery("select * from SchoolInfo");
                      print(x);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Text("Update"),
                    onPressed: () {
                      // _db.updateDB(
                      //   SchoolInfo(
                      //       id: id,
                      //       name: name,
                      //       address: address,
                      //       email: email,
                      //       phone: phone),
                      // );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
