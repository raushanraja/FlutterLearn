import 'package:flutter/material.dart';
import 'package:iotalarm/utils/ui/custom_colors.dart';

class SocketSettings extends StatefulWidget {
  @override
  _SocketSettingsState createState() => _SocketSettingsState();
}

class _SocketSettingsState extends State<SocketSettings> {
  final _socketFormKey = GlobalKey<FormState>();
  String _localUrl, _globalUrl;
  String emptyValidator(value) {
    if (value == null || value.isEmpty) return 'Please enter required info';
    return null;
  }

  TextStyle textStyle = TextStyle(
    color: CustomColors.cpone['cyan'],
    fontSize: 20,
  );

  InputDecoration socketInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 16),
      fillColor: Colors.blueGrey[700],
      filled: true,
      border: OutlineInputBorder(),
      hintText: hintText,
      hintStyle: textStyle.copyWith(color: Colors.white54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _socketFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socketTextFormField(
                hintText: '192.168.xxx.xxx:port', type: 'local'),
            socketTextFormField(hintText: 'example.com:port', type: 'global'),
            socketFormSaveButton()
          ],
        ));
  }

  TextButton socketFormSaveButton() {
    return TextButton(
              child: Text("Save"),
              style: TextButton.styleFrom(
                minimumSize: Size(150,50),
                primary: Colors.white,
                backgroundColor: CustomColors.primary[500],
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                )
              ),
              onPressed: () {
                print('onPressed called');
                _socketFormKey.currentState.validate();
                _socketFormKey.currentState.save();
                print("$_localUrl $_globalUrl");
              },
              );
  }

  Container socketTextFormField({hintText, type}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: TextFormField(
        decoration: socketInputDecoration(hintText),
        style: textStyle,
        validator: emptyValidator,
        onSaved: (value) {
          if (type == 'global') {
            _globalUrl = value;
          } else if (type == 'local') {
            _localUrl = value;
          }
        },
      ),
    );
  }
}
