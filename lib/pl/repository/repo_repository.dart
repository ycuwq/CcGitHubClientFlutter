import 'package:ccgithubclientflutter/pl/service/repo_service.dart';

class RepoRepository {
  /// 获取用户的前100个仓库和star数量
  static Future<RepoAndStarted> findUserRepoAndStarred(String user) async {
    var repos = await RepoService.getUserRepos(user, null, 100);
    if (repos == null) {
      return null;
    }
    int started = 0;
    for (var value in repos) {
      started += value.watchers_count;
    }
    return RepoAndStarted(started, repos);
  }
}

class RepoAndStarted {
  int _starred;

  int get starred => _starred;

  List _repos;

  List get repos => _repos;

  RepoAndStarted(int value, List repos) {
    _starred = value;
    repos = repos;
  }
}
