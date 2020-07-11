import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  String login;
  num id;
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
  String starred;
  num public_repos;
  num public_gists;
  num followers;
  num following;
  String created_at;
  String updated_at;

  User({this.login, this.id, this.node_id, this.avatar_url, this.gravatar_id, this.url, this.html_url, this.followers_url, this.following_url, this.gists_url, this.starred_url, this.subscriptions_url, this.organizations_url, this.repos_url, this.events_url, this.received_events_url, this.type, this.site_admin, this.name, this.company, this.blog, this.location, this.email, this.hireable, this.bio, this.twitter_username, this.starred, this.public_repos, this.public_gists, this.followers, this.following, this.created_at, this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

