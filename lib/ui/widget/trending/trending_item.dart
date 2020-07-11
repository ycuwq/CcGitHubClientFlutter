import 'package:ccgithubclientflutter/pl/model/Trending.dart';
import 'package:flutter/material.dart';

import '../gsy_user_icon_widget.dart';

class TrendingItem extends StatelessWidget {
  final Trending trending;

  TrendingItem(this.trending);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget des = Container(
        child: new Text(
          trending.description,
          maxLines: 3,
        ),
        margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
        alignment: Alignment.topLeft);

    Widget userImage = GSYUserIconWidget(
        padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 0.0),
        width: 30.0,
        height: 30.0,
        image: trending.avatar,
        onPressed: () {});

    return new Container(
      child: new Card(
          margin:
              EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
          child: new FlatButton(
              onPressed: () => {},
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        userImage,
                        new Expanded(
                            child: new Text(trending.author,
                                style: theme.textTheme.subtitle2)),
                        new Text(trending.language ?? "",
                            style: theme.textTheme.subtitle2),
                      ],
                    ),
                    new Container(
                        child: new Text(trending.name,
                            style: theme.textTheme.subtitle2),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    des,
                  ],
                ),
              ))),
    );
  }
}
