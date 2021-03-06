// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(
    id: json['id'] as num,
    node_id: json['node_id'] as String,
    name: json['name'] as String,
    full_name: json['full_name'] as String,
    owner: json['owner'] == null
        ? null
        : OwnerBean.fromJson(json['owner'] as Map<String, dynamic>),
    private: json['private'] as bool,
    html_url: json['html_url'] as String,
    description: json['description'] as String,
    fork: json['fork'] as bool,
    url: json['url'] as String,
    archive_url: json['archive_url'] as String,
    assignees_url: json['assignees_url'] as String,
    blobs_url: json['blobs_url'] as String,
    branches_url: json['branches_url'] as String,
    collaborators_url: json['collaborators_url'] as String,
    comments_url: json['comments_url'] as String,
    commits_url: json['commits_url'] as String,
    compare_url: json['compare_url'] as String,
    contents_url: json['contents_url'] as String,
    contributors_url: json['contributors_url'] as String,
    deployments_url: json['deployments_url'] as String,
    downloads_url: json['downloads_url'] as String,
    events_url: json['events_url'] as String,
    forks_url: json['forks_url'] as String,
    git_commits_url: json['git_commits_url'] as String,
    git_refs_url: json['git_refs_url'] as String,
    git_tags_url: json['git_tags_url'] as String,
    git_url: json['git_url'] as String,
    issue_comment_url: json['issue_comment_url'] as String,
    issue_events_url: json['issue_events_url'] as String,
    issues_url: json['issues_url'] as String,
    keys_url: json['keys_url'] as String,
    labels_url: json['labels_url'] as String,
    languages_url: json['languages_url'] as String,
    merges_url: json['merges_url'] as String,
    milestones_url: json['milestones_url'] as String,
    notifications_url: json['notifications_url'] as String,
    pulls_url: json['pulls_url'] as String,
    releases_url: json['releases_url'] as String,
    ssh_url: json['ssh_url'] as String,
    stargazers_url: json['stargazers_url'] as String,
    statuses_url: json['statuses_url'] as String,
    subscribers_url: json['subscribers_url'] as String,
    subscription_url: json['subscription_url'] as String,
    tags_url: json['tags_url'] as String,
    teams_url: json['teams_url'] as String,
    trees_url: json['trees_url'] as String,
    clone_url: json['clone_url'] as String,
    mirror_url: json['mirror_url'] as String,
    hooks_url: json['hooks_url'] as String,
    svn_url: json['svn_url'] as String,
    homepage: json['homepage'] as String,
    language: json['language'],
    forks_count: json['forks_count'] as num,
    stargazers_count: json['stargazers_count'] as num,
    watchers_count: json['watchers_count'] as num,
    size: json['size'] as num,
    default_branch: json['default_branch'] as String,
    open_issues_count: json['open_issues_count'] as num,
    is_template: json['is_template'] as bool,
    topics: (json['topics'] as List)?.map((e) => e as String)?.toList(),
    has_issues: json['has_issues'] as bool,
    has_projects: json['has_projects'] as bool,
    has_wiki: json['has_wiki'] as bool,
    has_pages: json['has_pages'] as bool,
    has_downloads: json['has_downloads'] as bool,
    archived: json['archived'] as bool,
    disabled: json['disabled'] as bool,
    visibility: json['visibility'] as String,
    pushed_at: json['pushed_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    permissions: json['permissions'] == null
        ? null
        : PermissionsBean.fromJson(json['permissions'] as Map<String, dynamic>),
    template_repository: json['template_repository'],
    temp_clone_token: json['temp_clone_token'] as String,
    delete_branch_on_merge: json['delete_branch_on_merge'] as bool,
    subscribers_count: json['subscribers_count'] as num,
    network_count: json['network_count'] as num,
    license: json['license'] == null
        ? null
        : LicenseBean.fromJson(json['license'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.node_id,
      'name': instance.name,
      'full_name': instance.full_name,
      'owner': instance.owner,
      'private': instance.private,
      'html_url': instance.html_url,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'archive_url': instance.archive_url,
      'assignees_url': instance.assignees_url,
      'blobs_url': instance.blobs_url,
      'branches_url': instance.branches_url,
      'collaborators_url': instance.collaborators_url,
      'comments_url': instance.comments_url,
      'commits_url': instance.commits_url,
      'compare_url': instance.compare_url,
      'contents_url': instance.contents_url,
      'contributors_url': instance.contributors_url,
      'deployments_url': instance.deployments_url,
      'downloads_url': instance.downloads_url,
      'events_url': instance.events_url,
      'forks_url': instance.forks_url,
      'git_commits_url': instance.git_commits_url,
      'git_refs_url': instance.git_refs_url,
      'git_tags_url': instance.git_tags_url,
      'git_url': instance.git_url,
      'issue_comment_url': instance.issue_comment_url,
      'issue_events_url': instance.issue_events_url,
      'issues_url': instance.issues_url,
      'keys_url': instance.keys_url,
      'labels_url': instance.labels_url,
      'languages_url': instance.languages_url,
      'merges_url': instance.merges_url,
      'milestones_url': instance.milestones_url,
      'notifications_url': instance.notifications_url,
      'pulls_url': instance.pulls_url,
      'releases_url': instance.releases_url,
      'ssh_url': instance.ssh_url,
      'stargazers_url': instance.stargazers_url,
      'statuses_url': instance.statuses_url,
      'subscribers_url': instance.subscribers_url,
      'subscription_url': instance.subscription_url,
      'tags_url': instance.tags_url,
      'teams_url': instance.teams_url,
      'trees_url': instance.trees_url,
      'clone_url': instance.clone_url,
      'mirror_url': instance.mirror_url,
      'hooks_url': instance.hooks_url,
      'svn_url': instance.svn_url,
      'homepage': instance.homepage,
      'language': instance.language,
      'forks_count': instance.forks_count,
      'stargazers_count': instance.stargazers_count,
      'watchers_count': instance.watchers_count,
      'size': instance.size,
      'default_branch': instance.default_branch,
      'open_issues_count': instance.open_issues_count,
      'is_template': instance.is_template,
      'topics': instance.topics,
      'has_issues': instance.has_issues,
      'has_projects': instance.has_projects,
      'has_wiki': instance.has_wiki,
      'has_pages': instance.has_pages,
      'has_downloads': instance.has_downloads,
      'archived': instance.archived,
      'disabled': instance.disabled,
      'visibility': instance.visibility,
      'pushed_at': instance.pushed_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'permissions': instance.permissions,
      'template_repository': instance.template_repository,
      'temp_clone_token': instance.temp_clone_token,
      'delete_branch_on_merge': instance.delete_branch_on_merge,
      'subscribers_count': instance.subscribers_count,
      'network_count': instance.network_count,
      'license': instance.license,
    };

LicenseBean _$LicenseBeanFromJson(Map<String, dynamic> json) {
  return LicenseBean(
    key: json['key'] as String,
    name: json['name'] as String,
    spdx_id: json['spdx_id'] as String,
    url: json['url'] as String,
    node_id: json['node_id'] as String,
  );
}

Map<String, dynamic> _$LicenseBeanToJson(LicenseBean instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdx_id,
      'url': instance.url,
      'node_id': instance.node_id,
    };

PermissionsBean _$PermissionsBeanFromJson(Map<String, dynamic> json) {
  return PermissionsBean(
    admin: json['admin'] as bool,
    push: json['push'] as bool,
    pull: json['pull'] as bool,
  );
}

Map<String, dynamic> _$PermissionsBeanToJson(PermissionsBean instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'push': instance.push,
      'pull': instance.pull,
    };

OwnerBean _$OwnerBeanFromJson(Map<String, dynamic> json) {
  return OwnerBean(
    login: json['login'] as String,
    id: json['id'] as num,
    node_id: json['node_id'] as String,
    avatar_url: json['avatar_url'] as String,
    gravatar_id: json['gravatar_id'] as String,
    url: json['url'] as String,
    html_url: json['html_url'] as String,
    followers_url: json['followers_url'] as String,
    following_url: json['following_url'] as String,
    gists_url: json['gists_url'] as String,
    starred_url: json['starred_url'] as String,
    subscriptions_url: json['subscriptions_url'] as String,
    organizations_url: json['organizations_url'] as String,
    repos_url: json['repos_url'] as String,
    events_url: json['events_url'] as String,
    received_events_url: json['received_events_url'] as String,
    type: json['type'] as String,
    site_admin: json['site_admin'] as bool,
  );
}

Map<String, dynamic> _$OwnerBeanToJson(OwnerBean instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'gravatar_id': instance.gravatar_id,
      'url': instance.url,
      'html_url': instance.html_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'gists_url': instance.gists_url,
      'starred_url': instance.starred_url,
      'subscriptions_url': instance.subscriptions_url,
      'organizations_url': instance.organizations_url,
      'repos_url': instance.repos_url,
      'events_url': instance.events_url,
      'received_events_url': instance.received_events_url,
      'type': instance.type,
      'site_admin': instance.site_admin,
    };
