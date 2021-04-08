import 'package:flutter/material.dart';
import 'package:iotalarm/data/bloc/SettingNotifier.dart';
import 'package:iotalarm/data/models/Setting.dart';
import 'package:iotalarm/utils/ui/custom_colors.dart';
import 'package:provider/provider.dart';

class SocketSettings extends StatefulWidget {
  @override
  _SocketSettingsState createState() => _SocketSettingsState();
}

class _SocketSettingsState extends State<SocketSettings> {
  final _socketFormKey = GlobalKey<FormState>();
  final _urlGlobalController = TextEditingController();
  final _urlLocalController = TextEditingController();
  final TextStyle textStyle =
      TextStyle(color: CustomColors.cpone['cyan'], fontSize: 20);

  String _localUrl, _globalUrl;

  @override
  void initState() {
    setStartupData();
    super.initState();
  }

  @override
  void dispose() {
    _urlGlobalController.dispose();
    _urlLocalController.dispose();
    super.dispose();
  }

  String emptyValidator(value) {
    if (value == null || value.isEmpty) return 'Please enter required info';
    return null;
  }

  void setStartupData() async {
    Setting settingData = await SettingNotifier().getSettings();
    Map d = settingData.toJson();
    _localUrl = d['localUrl'];
    _globalUrl = d['globalUrl'];
    _urlLocalController.text = _localUrl;
    _urlGlobalController.text = _globalUrl;
  }

  @override
  Widget build(BuildContext context) {
    print("form widget ran $_globalUrl $_localUrl");
    return Form(
        key: _socketFormKey,
        child: ChangeNotifierProvider<SettingNotifier>(
          create: (context) => SettingNotifier(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socketTextFormField(
                  hintText: '192.168.xxx.xxx:port',
                  type: 'local',
                  controller: _urlLocalController),
              socketTextFormField(
                  hintText: 'example.com:port',
                  type: 'global',
                  controller: _urlGlobalController),
              socketFormSaveButton()
            ],
          ),
        ));
  }


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

  Consumer<SettingNotifier> socketFormSaveButton() {
    return Consumer<SettingNotifier>(
        builder: (context, setting, child) {
          return TextButton(
              child: Text("Save"),
              style: TextButton.styleFrom(
                  minimumSize: Size(150, 50),
                  primary: Colors.white,
                  backgroundColor: CustomColors.primary[500],
                  textStyle: TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: () {
                print('onPressed called');
                _socketFormKey.currentState.validate();
                _socketFormKey.currentState.save();
                print("$_localUrl $_globalUrl");
                setting.changeSocketSetting(
                    globalUrl: _globalUrl, localUrl: _localUrl);
              },
            );});
  }

  Container socketTextFormField({hintText, type, controller}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: TextFormField(
        controller: controller,
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
