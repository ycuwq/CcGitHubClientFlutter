// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `oauth login`
  String get oauthLogin {
    return Intl.message(
      'oauth login',
      name: 'oauthLogin',
      desc: '',
      args: [],
    );
  }

  /// `open in browser`
  String get openInBrowser {
    return Intl.message(
      'open in browser',
      name: 'openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `登录失败`
  String get loginFailed {
    return Intl.message(
      '登录失败',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `网络错误`
  String get networkError {
    return Intl.message(
      '网络错误',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `[401错误可能: 未授权 \ 授权登录失败 \ 登录过期]`
  String get networkError401 {
    return Intl.message(
      '[401错误可能: 未授权 \ 授权登录失败 \ 登录过期]',
      name: 'networkError401',
      desc: '',
      args: [],
    );
  }

  /// `403权限错误`
  String get networkError403 {
    return Intl.message(
      '403权限错误',
      name: 'networkError403',
      desc: '',
      args: [],
    );
  }

  /// `404错误`
  String get networkError404 {
    return Intl.message(
      '404错误',
      name: 'networkError404',
      desc: '',
      args: [],
    );
  }

  /// `请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。`
  String get networkError422 {
    return Intl.message(
      '请求实体异常，请确保 Github ClientId 、账号秘密等信息正确。',
      name: 'networkError422',
      desc: '',
      args: [],
    );
  }

  /// `请求超时`
  String get networkErrorTimeout {
    return Intl.message(
      '请求超时',
      name: 'networkErrorTimeout',
      desc: '',
      args: [],
    );
  }

  /// `未知异常`
  String get networkErrorUnknown {
    return Intl.message(
      '未知异常',
      name: 'networkErrorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试`
  String get gitHubRefused {
    return Intl.message(
      'Github Api 出现异常[Connection refused]，建议换个网络环境或者稍后再试',
      name: 'gitHubRefused',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get my {
    return Intl.message(
      '我的',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `趋势`
  String get trend {
    return Intl.message(
      '趋势',
      name: 'trend',
      desc: '',
      args: [],
    );
  }

  /// `动态`
  String get feeds {
    return Intl.message(
      '动态',
      name: 'feeds',
      desc: '',
      args: [],
    );
  }

  /// `什么都没有`
  String get nothing_now {
    return Intl.message(
      '什么都没有',
      name: 'nothing_now',
      desc: '',
      args: [],
    );
  }

  /// `repos`
  String get public_repos {
    return Intl.message(
      'repos',
      name: 'public_repos',
      desc: '',
      args: [],
    );
  }

  /// `followers`
  String get followers {
    return Intl.message(
      'followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `following`
  String get following {
    return Intl.message(
      'following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `starred`
  String get starred {
    return Intl.message(
      'starred',
      name: 'starred',
      desc: '',
      args: [],
    );
  }

  /// `honor`
  String get honor {
    return Intl.message(
      'honor',
      name: 'honor',
      desc: '',
      args: [],
    );
  }

  /// `个人动态`
  String get user_dynamic_title {
    return Intl.message(
      '个人动态',
      name: 'user_dynamic_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}