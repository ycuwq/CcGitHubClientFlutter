import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  num id;
  String node_id;
  String name;
  String full_name;
  OwnerBean owner;
  bool private;
  String html_url;
  String description;
  bool fork;
  String url;
  String archive_url;
  String assignees_url;
  String blobs_url;
  String branches_url;
  String collaborators_url;
  String comments_url;
  String commits_url;
  String compare_url;
  String contents_url;
  String contributors_url;
  String deployments_url;
  String downloads_url;
  String events_url;
  String forks_url;
  String git_commits_url;
  String git_refs_url;
  String git_tags_url;
  String git_url;
  String issue_comment_url;
  String issue_events_url;
  String issues_url;
  String keys_url;
  String labels_url;
  String languages_url;
  String merges_url;
  String milestones_url;
  String notifications_url;
  String pulls_url;
  String releases_url;
  String ssh_url;
  String stargazers_url;
  String statuses_url;
  String subscribers_url;
  String subscription_url;
  String tags_url;
  String teams_url;
  String trees_url;
  String clone_url;
  String mirror_url;
  String hooks_url;
  String svn_url;
  String homepage;
  dynamic language;
  num forks_count;
  num stargazers_count;
  num watchers_count;
  num size;
  String default_branch;
  num open_issues_count;
  bool is_template;
  List<String> topics;
  bool has_issues;
  bool has_projects;
  bool has_wiki;
  bool has_pages;
  bool has_downloads;
  bool archived;
  bool disabled;
  String visibility;
  String pushed_at;
  String created_at;
  String updated_at;
  PermissionsBean permissions;
  dynamic template_repository;
  String temp_clone_token;
  bool delete_branch_on_merge;
  num subscribers_count;
  num network_count;
  LicenseBean license;

  Repo(
      {this.id,
      this.node_id,
      this.name,
      this.full_name,
      this.owner,
      this.private,
      this.html_url,
      this.description,
      this.fork,
      this.url,
      this.archive_url,
      this.assignees_url,
      this.blobs_url,
      this.branches_url,
      this.collaborators_url,
      this.comments_url,
      this.commits_url,
      this.compare_url,
      this.contents_url,
      this.contributors_url,
      this.deployments_url,
      this.downloads_url,
      this.events_url,
      this.forks_url,
      this.git_commits_url,
      this.git_refs_url,
      this.git_tags_url,
      this.git_url,
      this.issue_comment_url,
      this.issue_events_url,
      this.issues_url,
      this.keys_url,
      this.labels_url,
      this.languages_url,
      this.merges_url,
      this.milestones_url,
      this.notifications_url,
      this.pulls_url,
      this.releases_url,
      this.ssh_url,
      this.stargazers_url,
      this.statuses_url,
      this.subscribers_url,
      this.subscription_url,
      this.tags_url,
      this.teams_url,
      this.trees_url,
      this.clone_url,
      this.mirror_url,
      this.hooks_url,
      this.svn_url,
      this.homepage,
      this.language,
      this.forks_count,
      this.stargazers_count,
      this.watchers_count,
      this.size,
      this.default_branch,
      this.open_issues_count,
      this.is_template,
      this.topics,
      this.has_issues,
      this.has_projects,
      this.has_wiki,
      this.has_pages,
      this.has_downloads,
      this.archived,
      this.disabled,
      this.visibility,
      this.pushed_at,
      this.created_at,
      this.updated_at,
      this.permissions,
      this.template_repository,
      this.temp_clone_token,
      this.delete_branch_on_merge,
      this.subscribers_count,
      this.network_count,
      this.license});

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class LicenseBean {
  String key;
  String name;
  String spdx_id;
  String url;
  String node_id;

  LicenseBean({this.key, this.name, this.spdx_id, this.url, this.node_id});

  factory LicenseBean.fromJson(Map<String, dynamic> json) =>
      _$LicenseBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseBeanToJson(this);
}

@JsonSerializable()
class PermissionsBean {
  bool admin;
  bool push;
  bool pull;

  PermissionsBean({this.admin, this.push, this.pull});

  factory PermissionsBean.fromJson(Map<String, dynamic> json) =>
      _$PermissionsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsBeanToJson(this);
}

@JsonSerializable()
class OwnerBean {
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

  OwnerBean(
      {this.login,
      this.id,
      this.node_id,
      this.avatar_url,
      this.gravatar_id,
      this.url,
      this.html_url,
      this.followers_url,
      this.following_url,
      this.gists_url,
      this.starred_url,
      this.subscriptions_url,
      this.organizations_url,
      this.repos_url,
      this.events_url,
      this.received_events_url,
      this.type,
      this.site_admin});

  factory OwnerBean.fromJson(Map<String, dynamic> json) =>
      _$OwnerBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerBeanToJson(this);
}
