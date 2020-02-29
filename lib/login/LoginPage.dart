import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flow/authentication/Firebase_Auth.dart';
import 'package:login_flow/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("data"),
            ),
            FlatButton(
                onPressed: () async{
                  FirebaseUser user = await Provider.of<Auth>(context,listen: false).handleSignIn();
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        title: '${user.displayName}',
                      ),
                    ),
                  );
                },
                child: Text("Go to Home"))
          ],
        ),
      ),
    );
  }
}
