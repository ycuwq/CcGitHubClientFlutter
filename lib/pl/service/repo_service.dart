import 'package:ccgithubclientflutter/pl/model/repo.dart';
import 'package:ccgithubclientflutter/pl/network/http.dart';

/// 仓库
class RepoService {
  /// 用户的仓库列表
  static Future<List<Repo>> getUserRepos(userName, sort, perPage) async {
    sort ??= 'pushed';
    String url;
    if (userName == null) {
      url = "user//repos?sort=$sort&per_page=$perPage";
    } else {
      url = "users/$userName/repos?sort=$sort&per_page=$perPage";
    }
    final res = await Http().get(url);
    List<Repo> repos = List();
    if (res != null && res.result && res.data.length > 0) {
      for (int i = 0; i < res.data.length; i++) {
        var data = res.data[i];
        Repo repository = new Repo.fromJson(data);
        repos.add(repository);
      }
    }
    return repos;
  }

}