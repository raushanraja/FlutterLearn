import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpReq {
  final String token;
  final String clientName;
  final String website;
  final String cleintId;
  final String cleintSecret;
  String vapidKey;
  dynamic error;
  static const url = 'https://fosstodon.org/api/v1';

  HttpReq({
    @required this.token,
    this.cleintId,
    this.cleintSecret,
    this.clientName,
    this.website,
  });


   getOwnTimeline() async{
    String apiPoint='/timelines/home';
    try {
      var res = await http.get('${url}/timelines/home?limit=5',headers: {'Authorization': 'Bearer $token','Content-type':'application/json'});
      print(json.decode(res.body));
      // return res[0];
    } catch (e) {
      print('Error Occured $e');
    }
  }



  Future<Map<String,dynamic>> fetchInfo() async {
    var responseJson;
    try {
      responseJson =
          await http.get('${url}/apps/verify_credentials', headers: {'Authorization': 'Bearer $token'});
      // responseJson=json.decode(responseJson);
      responseJson = json.decode(responseJson.body);
    } catch (e) {
      print(e);
      return  {'error':'$e'};
    }
    print(responseJson);
    return {
      'clientName':responseJson['name'],
      'website':responseJson['website'],      
      'vapid':responseJson['vapid_key'],
    };
  }
}
