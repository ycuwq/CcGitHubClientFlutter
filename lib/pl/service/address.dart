import 'package:ccgithubclientflutter/config/github_config.dart';
import 'package:ccgithubclientflutter/constants.dart';

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

  ///处理分页参数
  static getPageParams(tab, page, [pageSize = Constants.PAGE_SIZE]) {
    if (page != null) {
      if (pageSize != null) {
        return "${tab}page=$page&per_page=$pageSize";
      } else {
        return "${tab}page=$page";
      }
    } else {
      return "";
    }
  }
}