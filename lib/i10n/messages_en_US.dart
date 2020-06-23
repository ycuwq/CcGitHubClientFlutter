// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "feeds" : MessageLookupByLibrary.simpleMessage("动态"),
    "gitHubRefused" : MessageLookupByLibrary.simpleMessage("Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试"),
    "login" : MessageLookupByLibrary.simpleMessage("login"),
    "loginFailed" : MessageLookupByLibrary.simpleMessage("登录失败"),
    "my" : MessageLookupByLibrary.simpleMessage("我的"),
    "networkError" : MessageLookupByLibrary.simpleMessage("网络错误"),
    "networkError401" : MessageLookupByLibrary.simpleMessage("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]"),
    "networkError403" : MessageLookupByLibrary.simpleMessage("403权限错误"),
    "networkError404" : MessageLookupByLibrary.simpleMessage("404错误"),
    "networkError422" : MessageLookupByLibrary.simpleMessage("请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。"),
    "networkErrorTimeout" : MessageLookupByLibrary.simpleMessage("请求超时"),
    "networkErrorUnknown" : MessageLookupByLibrary.simpleMessage("未知异常"),
    "oauthLogin" : MessageLookupByLibrary.simpleMessage("oauth login"),
    "openInBrowser" : MessageLookupByLibrary.simpleMessage("open in browser"),
    "trend" : MessageLookupByLibrary.simpleMessage("趋势")
  };
}
