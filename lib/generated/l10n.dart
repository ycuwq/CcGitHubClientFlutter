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

  /// `login failed`
  String get loginFailed {
    return Intl.message(
      'login failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `network error`
  String get networkError {
    return Intl.message(
      'network error',
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

  /// `network timeout`
  String get networkErrorTimeout {
    return Intl.message(
      'network timeout',
      name: 'networkErrorTimeout',
      desc: '',
      args: [],
    );
  }

  /// `network unknown error`
  String get networkErrorUnknown {
    return Intl.message(
      'network unknown error',
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

  /// `my`
  String get my {
    return Intl.message(
      'my',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `trend`
  String get trend {
    return Intl.message(
      'trend',
      name: 'trend',
      desc: '',
      args: [],
    );
  }

  /// `feeds`
  String get feeds {
    return Intl.message(
      'feeds',
      name: 'feeds',
      desc: '',
      args: [],
    );
  }

  /// `nothing`
  String get nothing_now {
    return Intl.message(
      'nothing',
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

  /// `user dynamic`
  String get user_dynamic_title {
    return Intl.message(
      'user dynamic',
      name: 'user_dynamic_title',
      desc: '',
      args: [],
    );
  }

  /// `daily`
  String get trending_day {
    return Intl.message(
      'daily',
      name: 'trending_day',
      desc: '',
      args: [],
    );
  }

  /// `weekly`
  String get trending_week {
    return Intl.message(
      'weekly',
      name: 'trending_week',
      desc: '',
      args: [],
    );
  }

  /// `monthly`
  String get trending_month {
    return Intl.message(
      'monthly',
      name: 'trending_month',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get trending_all {
    return Intl.message(
      'all',
      name: 'trending_all',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `中文`
  String get language_zh {
    return Intl.message(
      '中文',
      name: 'language_zh',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language_en {
    return Intl.message(
      'English',
      name: 'language_en',
      desc: '',
      args: [],
    );
  }

  /// `Theme Color`
  String get theme_color {
    return Intl.message(
      'Theme Color',
      name: 'theme_color',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `clean settings cache`
  String get clean_settings_cache {
    return Intl.message(
      'clean settings cache',
      name: 'clean_settings_cache',
      desc: '',
      args: [],
    );
  }

  /// `Login out`
  String get login_out {
    return Intl.message(
      'Login out',
      name: 'login_out',
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