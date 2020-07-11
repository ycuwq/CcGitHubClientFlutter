// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(days) => "${days} days ago";

  static m1(hours) => "${hours} hours ago";

  static m2(minute) => "${minute} minute ago";

  static m3(second) => "${second} seconds ago";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "clean_settings_cache" : MessageLookupByLibrary.simpleMessage("clean settings cache"),
    "dark_mode" : MessageLookupByLibrary.simpleMessage("Dark mode"),
    "days_ago" : m0,
    "feeds" : MessageLookupByLibrary.simpleMessage("feeds"),
    "followers" : MessageLookupByLibrary.simpleMessage("followers"),
    "following" : MessageLookupByLibrary.simpleMessage("following"),
    "gitHubRefused" : MessageLookupByLibrary.simpleMessage("Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试"),
    "honor" : MessageLookupByLibrary.simpleMessage("honor"),
    "hours_ago" : m1,
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "language_en" : MessageLookupByLibrary.simpleMessage("English"),
    "language_zh" : MessageLookupByLibrary.simpleMessage("中文"),
    "login" : MessageLookupByLibrary.simpleMessage("login"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("login failed"),
    "login_out" : MessageLookupByLibrary.simpleMessage("Login out"),
    "minute_ago" : m2,
    "my" : MessageLookupByLibrary.simpleMessage("my"),
    "networkError" : MessageLookupByLibrary.simpleMessage("network error"),
    "networkError401" : MessageLookupByLibrary.simpleMessage("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]"),
    "networkError403" : MessageLookupByLibrary.simpleMessage("403权限错误"),
    "networkError404" : MessageLookupByLibrary.simpleMessage("404错误"),
    "networkError422" : MessageLookupByLibrary.simpleMessage("请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。"),
    "networkErrorTimeout" : MessageLookupByLibrary.simpleMessage("network timeout"),
    "networkErrorUnknown" : MessageLookupByLibrary.simpleMessage("network unknown error"),
    "nothing_now" : MessageLookupByLibrary.simpleMessage("nothing"),
    "oauthLogin" : MessageLookupByLibrary.simpleMessage("oauth login"),
    "openInBrowser" : MessageLookupByLibrary.simpleMessage("open in browser"),
    "public_repos" : MessageLookupByLibrary.simpleMessage("repos"),
    "right_now" : MessageLookupByLibrary.simpleMessage("right now"),
    "seconds_ago" : m3,
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "starred" : MessageLookupByLibrary.simpleMessage("starred"),
    "theme_color" : MessageLookupByLibrary.simpleMessage("Theme Color"),
    "trend" : MessageLookupByLibrary.simpleMessage("trend"),
    "trending_all" : MessageLookupByLibrary.simpleMessage("all"),
    "trending_day" : MessageLookupByLibrary.simpleMessage("daily"),
    "trending_month" : MessageLookupByLibrary.simpleMessage("monthly"),
    "trending_week" : MessageLookupByLibrary.simpleMessage("weekly"),
    "user_dynamic_title" : MessageLookupByLibrary.simpleMessage("user dynamic")
  };
}
