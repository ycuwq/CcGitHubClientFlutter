import 'package:ccgithubclientflutter/common/navigate/nacigator_utils.dart';
import 'package:ccgithubclientflutter/pl/model/user.dart';
import 'package:ccgithubclientflutter/pl/repository/user_repository.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static const String ROUTE_NAME = "/";
  final String title = "welcome";
  @override
  State<StatefulWidget> createState() {
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      goNextPage();
    });
  }

  void goNextPage() async {
    User user = await UserRepository.getCurrentUser();
    if (user == null) {
      NavigatorUtils.goLogin(context);
    } else {
      NavigatorUtils.goHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.5),
              child: Text(
                'cc github client',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.5),
              child: Container(
                width: 200,
                height: 200,
                child: FlareActor("static/files/flare_flutter_logo_.flr",
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                    animation: "Placeholder"),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.9),
              child: Text(
                'power by flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ));
  }

}
