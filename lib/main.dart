import 'dart:async';

import 'package:ccgithubclientflutter/constants.dart';
import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/ui/model/theme_model.dart';
import 'package:ccgithubclientflutter/ui/page/home/home_page.dart';
import 'package:ccgithubclientflutter/pl/model/result_data.dart';
import 'package:ccgithubclientflutter/ui/page/login/login_page.dart';
import 'package:ccgithubclientflutter/ui/page/setting/settings_page.dart';
import 'package:ccgithubclientflutter/ui/page/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'common/provider_model.dart';
import 'common/event/index.dart';
import 'common/style/app_style.dart';

Future<void> main() async {
  await initSettings();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserModel()),
      ChangeNotifierProvider(create: (_)=> ThemeModel())
    ],
    child: MyApp(),
  ));

}
Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MyApp> with SingleTickerProviderStateMixin,HttpErrorListener {

  ThemeData defaultThemeData;

  @override
  Widget build(BuildContext context) {
    final themeDate = context.watch<ThemeModel>().getThemeData();
    return MaterialApp(
      title: 'github client',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        RefreshLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale.fromSubtags(languageCode: Settings.getValue<String>(Constants.SETTINGS_KEY_LANGUAGE, 'zh')),
      theme: themeDate,
      routes: {
        WelcomePage.ROUTE_NAME: (context) {
          _context = context;
          return WelcomePage();
        },
        HomePage.ROUTE_NAME: (context) {
          _context = context;
          return HomePage();
        },
        LoginPage.ROUTE_NAME: (context) {
          _context = context;
          return LoginPage();
        },
        SettingsPage.ROUTE_NAME: (context) {
          _context = context;
          return SettingsPage();
        }
      },
    );
  }

  ThemeData getThemeDate() {
    if (defaultThemeData == null) {
      String colorString = Settings.getValue(Constants.SETTINGS_KEY_COLOR, Colors.blue[500].value.toString());
      bool isDark = Settings.getValue(Constants.SETTINGS_KEY_DARK_MODE, false);
      defaultThemeData = ThemeData(
          primaryColor: StyleUtils.colorStringToMaterialColor(colorString),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: isDark ? Brightness.dark : Brightness.light
      );
    }
    return defaultThemeData;
  }
}

mixin HttpErrorListener on State<MyApp> {
  StreamSubscription stream;

  ///这里为什么用 _context 你理解吗？
  ///因为此时 State 的 context 是 FlutterReduxApp 而不是 MaterialApp
  ///所以如果直接用 context 是会获取不到 MaterialApp 的 Localizations 哦。
  BuildContext _context;

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
    stream = eventBus.on<ResultData>().listen((event) {
      errorHandleFunction(event.code, event.errorMessage);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    final location = S.of(_context);
    switch (code) {
      case ResultCode.GITHUB_API_REFUSED:
        showToast(location.gitHubRefused);
        break;
      case 401:
        showToast(location.networkError401);
        break;
      case 403:
        showToast(location.networkError403);
        break;
      case 404:
        showToast(location.networkError404);
        break;
      case 422:
        showToast(location.networkError422);
        break;
      case ResultCode.NETWORK_TIMEOUT:
      //超时
        showToast(location.networkError422);
        break;
      default:
        showToast(location.networkErrorUnknown +
            " " +
            message);
        break;
    }
  }

  showToast(String message) {
    print("showToast: " + message);
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }
}


