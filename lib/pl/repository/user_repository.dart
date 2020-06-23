import 'dart:convert';

import 'package:ccgithubclientflutter/pl/dao/local_storage.dart';
import 'package:ccgithubclientflutter/pl/service/user_service.dart';
import 'package:ccgithubclientflutter/pl/model/user.dart';
import 'package:ccgithubclientflutter/constants.dart';

class UserRepository {
  static Future<bool> oauth(String code) async {
    final res = await UserService.oauth(code);
    if (res != null && res.result) {
      var result = Uri.parse("http://oauth?" + res.data);
      var token = result.queryParameters["access_token"];
      var _token = 'token ' + token;
      await LocalStorage.save(Constants.LOCAL_KEY_TOKEN, _token);
      return true;
    } else {
      // todo 异常处理
      return false;
    }
  }

  static Future<User> getUserInfo() async {
    final res = await UserService.getMyUserInfo();
    if (res != null && res.result) {
      var data = User.fromJsonMap(res.data);
      saveCurrentUser(res.data);
      return data;
    }
    return null;
  }

  ///获取本地登录用户信息
  static Future<User> getCurrentUser() async {
    var userText = await LocalStorage.get(Constants.LOCAL_KEY_USER);
    if (userText != null) {
      var userMap = json.decode(userText);
      User user = User.fromJsonMap(userMap);
      return user;
    } else {
      return null;
    }
  }

  static saveCurrentUser(Map<String, dynamic> userData) async {
    if (userData == null) {
      return;
    }
    String data = json.encode(userData);
    LocalStorage.save(Constants.LOCAL_KEY_USER, data);
  }
}