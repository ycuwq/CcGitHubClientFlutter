import 'file:///E:/WorkSpace/Flutter/cc_github_client_flutter/lib/page/home/home_page.dart';
import 'package:ccgithubclientflutter/page/login/login_page.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static goHome(BuildContext context) {
    pushReplacementNamed(context, HomePage.ROUTE_NAME);
  }

  static goLogin(BuildContext context) {
    pushReplacementNamed(context, LoginPage.ROUTE_NAME);
  }
}