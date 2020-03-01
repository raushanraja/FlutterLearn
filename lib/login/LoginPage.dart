import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flow/authentication/Firebase_Auth.dart';
import 'package:login_flow/main.dart';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLogin = GlobalKey<FormState>();
  final _formSignup = GlobalKey<FormState>();

  bool isLoading = false;
  String _name;
  String _emailID;
  String _password;

  var _emailIDController = TextEditingController();
  var _passwordController = TextEditingController();
  var _nameController = TextEditingController();

  final TextStyle textstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _emailIDController.addListener(_changeEmailvalue);
    _passwordController.addListener(_changePasswordValue);
    _nameController.addListener(_changeNameValue);
  }

  @override
  void dispose() {
    _emailIDController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void updateLoader() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _changeEmailvalue() {
    _emailID = _emailIDController.text;
  }

  void _changePasswordValue() {
    _password = _passwordController.text;
  }

  void _changeNameValue() {
    _name = _nameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
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
                        initialIndex: 0,
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
                                  isSingup: false,
                                  textstyle: textstyle,
                                  singButton: SSignButton(
                                      textstyle: textstyle,
                                      buttonLabel: "Login",
                                      onTap: () async {
                                        SystemChannels.textInput
                                            .invokeMethod('TextInput.hide');
                                        updateLoader();
                                        var user = await Provider.of<Auth>(
                                                context,
                                                listen: false)
                                            .emailLogin(_emailID, _password);
                                        if (user["error"] == null) {
                                          print(user["user"].email);
                                          updateLoader();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                title: '${user["name"]}',
                                              ),
                                            ),
                                          );
                                        } else {
                                          updateLoader();
                                        }
                                      },
                                      buttonColor: Colors.blueAccent),
                                  textEditingController: [
                                    _emailIDController,
                                    _passwordController
                                  ],
                                ),
                                FormBuild(
                                  formLogin: _formSignup,
                                  isSingup: true,
                                  textstyle: textstyle,
                                  singButton: SSignButton(
                                      textstyle: textstyle,
                                      buttonLabel: "Sign UP",
                                      onTap: () async {
                                        if (_password != null ||
                                            _emailID != null ||
                                            _name != null) {
                                          var user = await Provider.of<Auth>(
                                                  context,
                                                  listen: false)
                                              .handleRegistration(
                                                  _emailID, _password, _name);
                                          if (user["error"] == null) {
                                            print(user["user"].email);
                                          } else {
                                            print(user["error"]);
                                          }
                                        }
                                      },
                                      buttonColor: Colors.blueAccent),
                                  textEditingController: [
                                    _emailIDController,
                                    _passwordController,
                                    _nameController
                                  ],
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
                            style:
                                TextStyle(fontSize: 15, color: Colors.black45),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isLoading
                ? Stack(
                    children: <Widget>[
                      Opacity(
                          opacity: 0.2,
                          child: ModalBarrier(
                              dismissible: false, color: Colors.grey)),
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class FormBuild extends StatelessWidget {
  FormBuild(
      {@required GlobalKey<FormState> this.formLogin,
      @required this.textstyle,
      @required this.singButton,
      @required this.textEditingController,
      @required this.isSingup});
  final GlobalKey<FormState> formLogin;
  final TextStyle textstyle;
  final Widget singButton;
  final List<TextEditingController> textEditingController;
  final bool isSingup;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formLogin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(
            visible: isSingup,
            child: InputField(
              label: "Name",
              onchange: () {},
              textEditingController:
                  textEditingController[textEditingController.length - 1],
            ),
          ),
          InputField(
            label: "Email",
            onchange: () {},
            textEditingController: textEditingController[0],
          ),
          InputField(
            label: "Password",
            onchange: () {},
            textEditingController: textEditingController[1],
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
