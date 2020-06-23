import 'dart:async';

import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/page/home/home_page.dart';
import 'package:ccgithubclientflutter/pl/model/result_data.dart';
import 'package:ccgithubclientflutter/page/login/login_page.dart';
import 'package:ccgithubclientflutter/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'common/event/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MyApp> with SingleTickerProviderStateMixin,HttpErrorListener {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
        }
      },
    );
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
        showToast(location.networkError);
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
      case ResultCode.GITHUB_API_REFUSED:
      //Github API 异常
        showToast(location.gitHubRefused);
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


