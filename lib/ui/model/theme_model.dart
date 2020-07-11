import 'package:ccgithubclientflutter/common/style/app_style.dart';
import 'package:ccgithubclientflutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

/// Provider  HonorModel
class ThemeModel extends ChangeNotifier {

  bool _isDark;
  Color _color;
  ThemeModel() {
    String colorString = Settings.getValue(Constants.SETTINGS_KEY_COLOR, Colors.blue[500].value.toString());
    _color = StyleUtils.colorStringToMaterialColor(colorString);
    _isDark = Settings.getValue(Constants.SETTINGS_KEY_DARK_MODE, false);
  }
  bool get isDark => _isDark;

  Color get getColor => _color;

  void setColor(Color color) {
    _color = color;

    notifyListeners();
  }

  void setDark(bool isDark) {
    _isDark = isDark;

    notifyListeners();
  }

  ThemeData getThemeData() {
    if (_color == null || _isDark == null) {
      return null;
    }
    return ThemeData(
      primaryColor: StyleUtils.colorToMaterialColor(_color),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: _isDark ? Brightness.dark : Brightness.light
    );
  }
}