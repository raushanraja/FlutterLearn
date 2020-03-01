import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loader Example"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
              child: FlatButton(
                  onPressed: () async{
                    setState(() {
                      isLoading = !isLoading;
                    });

                    Future.delayed(Duration(seconds: 4),(){
                      setState(() {
                        isLoading=!isLoading;
                      });
                    });

                  },
                  child: Text("Start Loading")),
            ),
          isLoading
          ? Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.2,
                child: ModalBarrier(dismissible: false,color: Colors.grey)),
              Center(child: CircularProgressIndicator(),)
            ],
          ):Visibility(visible: false,child: Text("")),
          
        ],
      )
    );
  }
}
