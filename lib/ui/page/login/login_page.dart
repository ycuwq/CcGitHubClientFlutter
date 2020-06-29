import 'dart:async';

import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/repository/user_repository.dart';
import 'package:ccgithubclientflutter/pl/service/address.dart';
import 'package:ccgithubclientflutter/common/navigate/nacigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE_NAME = "login";

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {

  StreamSubscription _sub;

  Future<Null> initUniLinks() async {
    _sub = getLinksStream().listen((String event) {
      if (event != null && event.startsWith("ccgithubflutter://ycuwq.xyz/oauth")) {
        doOauth(context, event);
      }
    }, onError: (Object err) {
      print("Failed to get latest link: $err.");
    });
  }

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }


  @override
  void dispose() {
    super.dispose();
    if (_sub != null) {
      _sub.cancel();
    }
  }

  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        )
    );
  }
  final FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    var url = Address.getOAuthUrl();
    var appLocation = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocation.oauthLogin),
        actions: [PopupMenuButton(
          itemBuilder: (BuildContext context) =>
          <PopupMenuItem<String>>[
            selectView(
                Icons.open_in_browser, appLocation.openInBrowser, 'browser')
          ],
          onSelected: (String action) {
            switch (action) {
              case 'browser':
                launch(url);
                break;
            }
          },
        )
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        navigationDelegate: (NavigationRequest navigation) {
          if (navigation.url != null &&
              navigation.url.startsWith("ccgithubflutter://ycuwq.xyz/oauth")) {
            doOauth(context, navigation.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        }
      ),
    );
  }

  doOauth(BuildContext context, String url) async {
    var code = Uri.parse(url).queryParameters["code"];
    var result = await UserRepository.oauth(code);
    if (result) {
      NavigatorUtils.goHome(context);
    }
  }
}