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
  final _formLogin = GlobalKey<FormState>();
  final _formSignup = GlobalKey<FormState>();

  String _emailID;
  String _password;

  var _emailIDController = TextEditingController();
  var _passwordController = TextEditingController();
  final TextStyle textstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _emailIDController.addListener(_changeEmailvalue);
    _passwordController.addListener(_changePasswordValue);
  }

  @override
  void dispose() {
    _emailIDController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _changeEmailvalue() {
    _emailID = _emailIDController.text;
  }

  void _changePasswordValue() {
    _password = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height) * 5 / 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlutterLogo(
                  size: 80,
                ),
                DefaultTabController(
                    length: 2,
                    initialIndex: 1,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          tabs: [
                            BuildTab(tabLabel: "SIGN IN"),
                            BuildTab(tabLabel: "SIGN UP"),
                          ],
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300,
                          ),
                          child: TabBarView(children: [
                            FormBuild(
                              formLogin: _formLogin,
                              textstyle: textstyle,
                              singButton: SSignButton(
                                  textstyle: textstyle,
                                  buttonLabel: "Login",
                                  onTap: () async {
                                    var user = await Provider.of<Auth>(context,
                                            listen: false)
                                        .emailLogin(_emailID, _password);
                                    if (user != null) {
                                      print(user["user"].email);
                                       print(user["user"].email);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                              title: '${user["user"].displayName}',
                                            ),
                                          ),
                                        );
                                    }
                                  },
                                  buttonColor: Colors.blueAccent),
                              textEditingControllerEmail: _emailIDController,
                              textEditingControllerPassword:
                                  _passwordController,
                            ),
                            FormBuild(
                              formLogin: _formSignup,
                              textstyle: textstyle,
                              singButton: SSignButton(
                                  textstyle: textstyle,
                                  buttonLabel: "Sign UP",
                                  onTap: () async {
                                    if (_password != null || _emailID != null) {
                                      var user = await Provider.of<Auth>(
                                              context,
                                              listen: false)
                                          .handleRegistration(
                                              _emailID, _password);
                                      if (user["error"] == null) {
                                       print(user["user"].email);
                                      }else{
                                        print(user["error"]);
                                      }
                                    }
                                  },
                                  buttonColor: Colors.blueAccent),
                              textEditingControllerEmail: _emailIDController,
                              textEditingControllerPassword:
                                  _passwordController,
                            ),
                          ]),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                  child: Text(
                    'or',
                    style: TextStyle(color: Colors.black38),
                    textAlign: TextAlign.center,
                  ),
                ),
                SSignButton(
                  textstyle: textstyle,
                  buttonLabel: 'Google',
                  onTap: () async {
                    FirebaseUser user =
                        await Provider.of<Auth>(context, listen: false)
                            .handleSignIn();
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                            title: '${user.displayName}',
                          ),
                        ),
                      );
                    }
                  },
                  buttonColor: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: GestureDetector(
                    onTap: () {
                      print("Forgot Password");
                    },
                    child: Text("Forgot Password?",
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormBuild extends StatelessWidget {
  FormBuild({
    @required GlobalKey<FormState> this.formLogin,
    @required this.textstyle,
    @required this.singButton,
    @required this.textEditingControllerEmail,
    @required this.textEditingControllerPassword,
  });

  final GlobalKey<FormState> formLogin;
  final TextStyle textstyle;
  final Widget singButton;
  final TextEditingController textEditingControllerEmail;
  final TextEditingController textEditingControllerPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formLogin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputField(
            label: "Email",
            onchange: (value) {
              print(value);
            },
            textEditingController: textEditingControllerEmail,
          ),
          InputField(
            label: "Password",
            onchange: () {},
            textEditingController: textEditingControllerPassword,
          ),
          singButton
        ],
      ),
    );
  }
}

class SSignButton extends StatelessWidget {
  const SSignButton({
    @required this.textstyle,
    @required this.buttonLabel,
    @required this.onTap,
    @required this.buttonColor,
  });
  final TextStyle textstyle;
  final String buttonLabel;
  final Function onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: MaterialButton(
        onPressed: onTap,
        color: buttonColor,
        height: 40,
        child: Text(
          buttonLabel,
          style: textstyle,
        ),
      ),
    );
  }
}

class BuildTab extends StatelessWidget {
  final String tabLabel;
  BuildTab({@required this.tabLabel});
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabLabel,
        style: TextStyle(
            color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final Function onchange;
  final String label;
  final TextEditingController textEditingController;
  InputField(
      {@required this.label,
      @required this.onchange,
      @required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
            ),
          ),
        ),
      ),
    );
  }
}
