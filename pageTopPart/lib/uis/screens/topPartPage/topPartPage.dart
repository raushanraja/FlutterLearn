import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TopPartPage extends StatefulWidget {
  @override
  _TopPartPageState createState() => _TopPartPageState();
}

class _TopPartPageState extends State<TopPartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                decoration: BoxDecoration(
                    color : Color.fromRGBO(51, 102, 243,.8),
                    borderRadius: BorderRadius.vertical(bottom:Radius.circular(4)),
                ),
                      child: Container(
                        color: Colors.black26,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      color:Colors.blue[900],
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(color: Colors.white70,blurRadius: 0,offset: Offset(0,0),spreadRadius: 5)]
                                    ),
                                    child: Center(
                                      child: Text("50", style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),),
                                    ),
                                  ),
                                  Text("Abcdefgffdf Dewewew",
                                    style: TextStyle(
                                    fontSize: 25,
                                      color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
                  )),
              Expanded(
                  flex: 6,
                  child: Text("Bottom Part"))
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height*0.85); //vertical line
    path.cubicTo(size.width/3, size.height, 2*size.width/3, size.height*0.5, size.width, size.height*0.85); ////quadratic curve
    path.lineTo(size.width, 0); //vertical line
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}