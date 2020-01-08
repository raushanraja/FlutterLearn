import 'package:db_drawer/database/Info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => MyDB().schoolInfoDao,
        )
      ],
      child: MaterialApp(
        title: 'Drawer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.iBMPlexMonoTextTheme(),
          ),
        ),
        home: MyHomePage(title: 'Drawer DB'),
      ),
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
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  int id = 0;
  String name = "", address = "", email = "", phone = "";
  var data;
  @override
  Widget build(BuildContext context) {
    final _db = Provider.of<SchoolInfoDao>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Center(
          child: FutureBuilder(
            future: _db.showSchoolInfo(),
            builder: (context, snapshot) {
              data = snapshot.data;
              if (snapshot.hasData) {
                return SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[Text("Id : ${data[0].id}")],
                      ),
                      Row(
                        children: <Widget>[Text("name : ${data[0].name}")],
                      ),
                      Row(
                        children: <Widget>[Text("email : ${data[0].email}")],
                      ),
                      Row(
                        children: <Widget>[
                          Text("address : ${data[0].address}")
                        ],
                      ),
                      Row(
                        children: <Widget>[Text("phone : ${data[0].phone}")],
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
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
                    onPressed: () {
                      _db.insert(
                        SchoolInfo(
                            id: id,
                            name: name,
                            address: address,
                            email: email,
                            phone: phone),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Text("Update"),
                    onPressed: () {
                      _db.updateDB(
                        SchoolInfo(
                            id: id,
                            name: name,
                            address: address,
                            email: email,
                            phone: phone),
                      );
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
