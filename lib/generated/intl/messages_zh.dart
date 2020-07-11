// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static m0(days) => "${days} 天前";

  static m1(hours) => "${hours} 小时前前";

  static m2(minute) => "${minute} 分钟前";

  static m3(second) => "${second} 秒前";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "clean_settings_cache" : MessageLookupByLibrary.simpleMessage("清除设置缓存"),
    "dark_mode" : MessageLookupByLibrary.simpleMessage("黑暗模式"),
    "days_ago" : m0,
    "feeds" : MessageLookupByLibrary.simpleMessage("动态"),
    "followers" : MessageLookupByLibrary.simpleMessage("粉丝"),
    "following" : MessageLookupByLibrary.simpleMessage("关注"),
    "gitHubRefused" : MessageLookupByLibrary.simpleMessage("Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试"),
    "honor" : MessageLookupByLibrary.simpleMessage("荣耀"),
    "hours_ago" : m1,
    "language" : MessageLookupByLibrary.simpleMessage("语言"),
    "language_en" : MessageLookupByLibrary.simpleMessage("English"),
    "language_zh" : MessageLookupByLibrary.simpleMessage("中文"),
    "login" : MessageLookupByLibrary.simpleMessage("登录"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("登录失败"),
    "login_out" : MessageLookupByLibrary.simpleMessage("重新登录"),
    "minute_ago" : m2,
    "my" : MessageLookupByLibrary.simpleMessage("我的"),
    "networkError" : MessageLookupByLibrary.simpleMessage("网络错误"),
    "networkError401" : MessageLookupByLibrary.simpleMessage("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]"),
    "networkError403" : MessageLookupByLibrary.simpleMessage("403权限错误"),
    "networkError404" : MessageLookupByLibrary.simpleMessage("404错误"),
    "networkError422" : MessageLookupByLibrary.simpleMessage("请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。"),
    "networkErrorTimeout" : MessageLookupByLibrary.simpleMessage("请求超时"),
    "networkErrorUnknown" : MessageLookupByLibrary.simpleMessage("未知异常"),
    "nothing_now" : MessageLookupByLibrary.simpleMessage("什么都没有"),
    "oauthLogin" : MessageLookupByLibrary.simpleMessage("授权登录"),
    "openInBrowser" : MessageLookupByLibrary.simpleMessage("在浏览器打开"),
    "public_repos" : MessageLookupByLibrary.simpleMessage("仓库"),
    "right_now" : MessageLookupByLibrary.simpleMessage("刚刚"),
    "seconds_ago" : m3,
    "settings" : MessageLookupByLibrary.simpleMessage("设置"),
    "starred" : MessageLookupByLibrary.simpleMessage("星标"),
    "theme_color" : MessageLookupByLibrary.simpleMessage("主题颜色"),
    "trend" : MessageLookupByLibrary.simpleMessage("趋势"),
    "trending_all" : MessageLookupByLibrary.simpleMessage("全部"),
    "trending_day" : MessageLookupByLibrary.simpleMessage("今日"),
    "trending_month" : MessageLookupByLibrary.simpleMessage("本月"),
    "trending_week" : MessageLookupByLibrary.simpleMessage("本周"),
    "user_dynamic_title" : MessageLookupByLibrary.simpleMessage("个人动态")
  };
}
