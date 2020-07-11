import 'package:ccgithubclientflutter/ui/page/home/home_page.dart';
import 'package:ccgithubclientflutter/ui/page/login/login_page.dart';
import 'package:ccgithubclientflutter/ui/page/setting/settings_page.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
  static goHome(BuildContext context) {
    pushReplacementNamed(context, HomePage.ROUTE_NAME);
  }

  static goLogin(BuildContext context) {
    pushReplacementNamed(context, LoginPage.ROUTE_NAME);
  }

  static goSettings(BuildContext context) {
    pushNamed(context, SettingsPage.ROUTE_NAME);
  }

  ///弹出 dialog
  static Future<T> showDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(

            ///不受系统字体缩放影响
              data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .copyWith(textScaleFactor: 1),
              child: new SafeArea(child: builder(context)));
        });
  }
}