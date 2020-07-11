import 'package:ccgithubclientflutter/common/navigate/nacigator_utils.dart';
import 'package:ccgithubclientflutter/constants.dart';
import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/ui/model/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const String ROUTE_NAME = "settings";

  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var appLocation = S.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(appLocation.settings),
        ),
        body: ListView(
          children: [
            SwitchSettingsTile(
              settingKey: Constants.SETTINGS_KEY_DARK_MODE,
              title: appLocation.dark_mode,
              leading: Icon(Icons.palette),
              defaultValue: false,
              onChange: (value) {
                context.read<ThemeModel>().setDark(value);
              },
            ),
            ColorPickerSettingsTile(
              title: appLocation.theme_color,
              settingKey: Constants.SETTINGS_KEY_COLOR,
              defaultValue: Colors.blue,
              onChange: (value) {
                context.read<ThemeModel>().setColor(value);
              },
            ),
            RadioModalSettingsTile<String>(
              title: appLocation.language,
              settingKey: Constants.SETTINGS_KEY_LANGUAGE,
              values: <String, String>{
                'zh': appLocation.language_zh,
                'en': appLocation.language_en
              },
              selected: 'zh',
              onChange: (value) {
                context.findRootAncestorStateOfType().setState(() {
                  S.load(Locale.fromSubtags(languageCode: value));
                });
              },
            ),
            RaisedButton(
              child: Text(appLocation.login_out),
              onPressed: () => {NavigatorUtils.goLogin(context)},
            )
          ],
        ));
  }
}
