import 'package:ccgithubclientflutter/config/github_config.dart';

class Address {
  static const String graphicHost = 'https://ghchart.rshah.org/';
  static getOAuthUrl() {
    return "https://github.com/login/oauth/authorize?client_id"
        "=${NetConfig.CLIENT_ID}&state=app&"
        "redirect_uri=ccgithubflutter://ycuwq.xyz/oauth";
  }

  static String getUserChartAddress(String color, String userName) {
    return Address.graphicHost +
        color +
        "/" +
        userName;
  }
}