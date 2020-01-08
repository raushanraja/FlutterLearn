import 'package:flutter/material.dart';
import 'package:flutter_db/admission/components/admission_form.dart';

class Admission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 60,
          title: Text("Admission Form")
        ),
        body: AdmissionForm(),
      )
    );
  }
}
