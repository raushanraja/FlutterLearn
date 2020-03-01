import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataService {
  final String UID;
  DataService({@required this.UID});
  // Reference to the collection
  final CollectionReference userCollection =
      Firestore.instance.collection('userData');

  Future updateUserData(String name, String email) async {
    return await userCollection
        .document(UID)
        .setData({"name": name, "email": email});
  }

  Future getUsetInfo() async{
  return await userCollection.document(UID).get();
  }
}
