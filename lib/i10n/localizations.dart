import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get login {
    return Intl.message("登录", name: 'login');
  }

  String get oauthLogin {
    return Intl.message("授权登录", name: 'oauthLogin');
  }

  String get openInBrowser {
    return Intl.message("在浏览器打开", name: 'openInBrowser');
  }

  String get loginFailed {
    return Intl.message("登录失败", name: 'loginFailed');
  }

  String get networkError {
    return Intl.message("网络错误", name: 'networkError');
  }

  String get networkError401 {
    return Intl.message("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]", name: 'networkError401');
  }

  String get networkError403 {
    return Intl.message("403权限错误", name: 'networkError403');
  }

  String get networkError404 {
    return Intl.message("404错误", name: 'networkError404');
  }

  String get networkError422 {
    return Intl.message("请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。", name: 'networkError422');
  }

  String get networkErrorTimeout {
    return Intl.message("请求超时", name: 'networkErrorTimeout');
  }

  String get networkErrorUnknown {
    return Intl.message("未知异常", name: 'networkErrorUnknown');
  }

  String get gitHubRefused {
    return Intl.message("Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试", name: 'gitHubRefused');
  }

  String get my {
    return Intl.message("我的", name: "my");
  }
  String get trend {
    return Intl.message("趋势", name: "trend");
  }

  String get feeds {
    return Intl.message("动态", name: "feeds");
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}