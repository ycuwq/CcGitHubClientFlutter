import 'package:ccgithubclientflutter/pl/network/http.dart';
import 'package:ccgithubclientflutter/pl/model/result_data.dart';
import 'package:ccgithubclientflutter/config/github_config.dart';

class UserService {
  static Future<ResultData> oauth(code) async {
    var res = await Http().get("https://github.com/login/oauth/access_token?"
        "client_id=${NetConfig.CLIENT_ID}"
        "&client_secret=${NetConfig.CLIENT_SECRET}"
        "&code=$code");
    return res;
  }

  static Future<ResultData> getMyUserInfo() async {
    var res = await Http().get("user");
    return res;
  }

  static Future<String> getUserStar(userName, sort) async {
    sort ??= 'updated';
    final res = await Http().get("users/$userName/starred?sort=$sort&per_page=1");
    if (res != null && res.result && res.headers != null) {
      try {
        List<String> link = res.headers['link'];
        if (link != null) {
          int indexStart = link[0].lastIndexOf("page=") + 5;
          int indexEnd = link[0].lastIndexOf(">");
          if (indexStart >= 0 && indexEnd >= 0) {
            String count = link[0].substring(indexStart, indexEnd);
            return count;
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return null;
  }
}