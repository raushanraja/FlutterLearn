import 'package:flutter/material.dart';
Container loaderWidget() {
    return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
  }