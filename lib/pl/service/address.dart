import 'package:ccgithubclientflutter/config/ignoreConfig.dart';

class Address {
  static getOAuthUrl() {
    return "https://github.com/login/oauth/authorize?client_id"
        "=${NetConfig.CLIENT_ID}&state=app&"
        "redirect_uri=ccgithubflutter://ycuwq.xyz/oauth";
  }
}