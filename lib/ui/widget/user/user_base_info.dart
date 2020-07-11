import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:ccgithubclientflutter/ui/widget/gsy_icon_text.dart';
import 'package:flutter/material.dart';

class UserBaseInfoWidget extends StatelessWidget {
  final User user;

  const UserBaseInfoWidget({this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = S.of(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: _renderImg(context, user.avatar_url),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.login,
                  style: theme.textTheme.headline6,
                ),
                Text(
                  user.name,
                ),
                GSYIConText(
                  Icons.people,
                  user.company ?? appLocalizations.nothing_now,
                  theme.textTheme.caption,
                  theme.textSelectionColor,
                  15.0,
                  padding: 1.5,
                ),
                GSYIConText(
                  Icons.location_on,
                  user.location ?? appLocalizations.nothing_now,
                  theme.textTheme.caption,
                  theme.textSelectionColor,
                  15.0,
                  padding: 1.5,
                )
              ],
            )
          ],
        ),
        Container(
            child: new Text(
              user.email ?? "",
            ),
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft),
        Container(
            child: new Text(
              user.bio ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            alignment: Alignment.topLeft),
      ],
    );
  }

  _renderImg(context, String url) {
    return new RawMaterialButton(
        onPressed: () {
          if (url != null) {}
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
        child: new ClipOval(
          child: new FadeInImage.assetNetwork(
            placeholder: 'static/images/flutter.png',
            //预览图
            fit: BoxFit.fitWidth,
            image: url ??
                'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png',
            width: 85.0,
            height: 85.0,
          ),
        ));
  }
}
