import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:ccgithubclientflutter/pl/service/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserContributionChart extends StatelessWidget {
  final User userInfo;

  UserContributionChart(this.userInfo);

  _renderChart(context, ThemeData theme, S localizations) {
    double height = 140.0;
    double width = 3 * MediaQuery.of(context).size.width / 2;
    if (userInfo.login != null && userInfo.type == "Organization") {
      return new Container();
    }
    return (userInfo.login != null)
        ? new Card(
            margin:
                EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0, bottom: 0.0),
            child: new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                width: width,
                height: height,

                ///svg chart
                child: new SvgPicture.network(
                  Address.getUserChartAddress(
                      theme.primaryColor.value
                          .toRadixString(16)
                          .padLeft(8, '0')
                          .toString(),
                      userInfo.login),
                  width: width,
                  height: height - 10,
                  allowDrawingOutsideViewBox: true,
                  placeholderBuilder: (BuildContext context) => new Container(
                    height: height,
                    width: width,
                    child: Center(
                      child:
                          SpinKitRipple(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ),
          )
        : new Container(
            height: height,
            child: Center(
              child: SpinKitRipple(color: Theme.of(context).primaryColor),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = S.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          new Container(
              child: new Text(
                appLocalizations.user_dynamic_title,
                style: theme.textTheme.subtitle2,
                overflow: TextOverflow.ellipsis,
              ),
              margin: new EdgeInsets.only(top: 15.0, bottom: 15.0, left: 12.0),
              alignment: Alignment.topLeft),
          _renderChart(context, theme, appLocalizations),
        ],
      ),
    );
  }
}
