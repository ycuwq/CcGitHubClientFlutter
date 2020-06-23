import 'package:ccgithubclientflutter/pl/network/http.dart';
import 'package:ccgithubclientflutter/pl/model/result_data.dart';
import 'package:ccgithubclientflutter/config/ignoreConfig.dart';

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
}