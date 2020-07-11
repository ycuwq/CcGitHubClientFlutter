import 'package:ccgithubclientflutter/pl/model/Trending.dart';
import 'package:ccgithubclientflutter/pl/network/http.dart';

class TrendingService {
  ///since: daily, weekly, monthly
  static Future<List<Trending>> getTrending(String language, String since) async {
    String url = "https://ghapi.huchen.dev/repositories?language=${language ?? ''}&since=${since ?? ''}&spoken_language_code=";
    final res = await Http().get(url);
    List<Trending> trendingList = List();
    if (res != null && res.result && res.data.length > 0) {
      for (int i = 0; i < res.data.length; i++) {
        var data = res.data[i];
        Trending event = Trending.fromJson(data);
        trendingList.add(event);
      }
    }
    return trendingList;
  }
}