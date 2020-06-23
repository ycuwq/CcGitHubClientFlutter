import 'package:ccgithubclientflutter/pl/dao/local_storage.dart';
import 'package:ccgithubclientflutter/constants.dart';
import 'package:dio/dio.dart';

/// Token拦截器
class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        await LocalStorage.save(Constants.LOCAL_KEY_TOKEN, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(Constants.LOCAL_KEY_TOKEN);
  }

  ///获取授权token
  getAuthorization() async {
    final token = await LocalStorage.get(Constants.LOCAL_KEY_TOKEN);
    print("##### token: $token");
    return token;
  }
}
