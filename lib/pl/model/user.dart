class User {
  String login;
  int id;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;
  String name;
  String company;
  String blog;
  String location;
  String email;
  bool hireable;
  String bio;
  String twitter_username;
  int public_repos;
  int public_gists;
  int followers;
  int following;
  String created_at;
  String updated_at;
  String starred;

  User.fromJsonMap(Map<String, dynamic> map)
      : login = map["login"],
        id = map["id"],
        node_id = map["node_id"],
        avatar_url = map["avatar_url"],
        gravatar_id = map["gravatar_id"],
        url = map["url"],
        html_url = map["html_url"],
        followers_url = map["followers_url"],
        following_url = map["following_url"],
        gists_url = map["gists_url"],
        starred_url = map["starred_url"],
        subscriptions_url = map["subscriptions_url"],
        organizations_url = map["organizations_url"],
        repos_url = map["repos_url"],
        events_url = map["events_url"],
        received_events_url = map["received_events_url"],
        type = map["type"],
        site_admin = map["site_admin"],
        name = map["name"],
        company = map["company"],
        blog = map["blog"],
        location = map["location"],
        email = map["email"],
        hireable = map["hireable"],
        bio = map["bio"],
        twitter_username = map["twitter_username"],
        public_repos = map["public_repos"],
        public_gists = map["public_gists"],
        followers = map["followers"],
        following = map["following"],
        created_at = map["created_at"],
        updated_at = map["updated_at"],
        starred = map["starred"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = node_id;
    data['avatar_url'] = avatar_url;
    data['gravatar_id'] = gravatar_id;
    data['url'] = url;
    data['html_url'] = html_url;
    data['followers_url'] = followers_url;
    data['following_url'] = following_url;
    data['gists_url'] = gists_url;
    data['starred_url'] = starred_url;
    data['subscriptions_url'] = subscriptions_url;
    data['organizations_url'] = organizations_url;
    data['repos_url'] = repos_url;
    data['events_url'] = events_url;
    data['received_events_url'] = received_events_url;
    data['type'] = type;
    data['site_admin'] = site_admin;
    data['name'] = name;
    data['company'] = company;
    data['blog'] = blog;
    data['location'] = location;
    data['email'] = email;
    data['hireable'] = hireable;
    data['bio'] = bio;
    data['twitter_username'] = twitter_username;
    data['public_repos'] = public_repos;
    data['public_gists'] = public_gists;
    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['starred'] = starred;
    return data;
  }
}
