import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  User _userInfo;

  void setUser(User userInfo) {
    this._userInfo = userInfo;
    notifyListeners();
  }

  User getUser() => _userInfo;

}