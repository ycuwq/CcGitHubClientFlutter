import 'package:ccgithubclientflutter/common/provider_model.dart';
import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/user.dart';
import 'package:ccgithubclientflutter/pl/repository/repo_repository.dart';
import 'package:ccgithubclientflutter/ui/widget/gsy_icon_text.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_base_info.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_contribution_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final HonorModel honorModel = HonorModel();

  @override
  void initState() {
    super.initState();
    _getHonor();
  }

  void _getHonor() async {
    var honor = await RepoRepository.findUserRepoAndStarred(null);
    honorModel.setData(honor.starred, honor.repos);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>().getUser();
    final localizations = S.of(context);
    return Container(
      child: Column(
        children: [_renderUserCard(context, user, localizations)],
      ),
    );
  }

  _renderUserCard(context, User user, S localizations) {
    return new Column(
      children: [
        Card(
            child: Column(
          children: [
            UserBaseInfoWidget(
              user: user,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderBottomItem(context, localizations.public_repos,
                    user.public_repos.toString(), () {}),
                _renderBottomItem(context, localizations.followers,
                    user.followers.toString(), () {}),
                _renderBottomItem(context, localizations.following,
                    user.following.toString(), () {}),
                _renderBottomItem(
                    context, localizations.starred, user.starred, () {}),
                MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => honorModel,
                    )
                  ],
                  child: Consumer<HonorModel>(
                    builder: (context, honorModel, _) {
                      return _renderBottomItem(
                          context,
                          localizations.honor,
                          honorModel._beStaredCount?.toString() ?? "---",
                          () {});
                    },
                  ),
                )
              ],
            ),
          ],
        )),
        UserContributionChart(user)
      ],
    );
  }

  _renderBottomItem(context, String title, String value, Function onPressed) {
    String data = value ?? "";
    final theme = Theme.of(context);
    return new Expanded(
        child: new Center(
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.subtitle2,
            ),
            Text(
              data,
              style: theme.textTheme.bodyText2,
            )
          ],
        ),
      ),
    ));
  }
}

/// Provider  HonorModel
class HonorModel extends ChangeNotifier {
  int _beStaredCount;

  int get beStaredCount => _beStaredCount;

  List _honorList;

  List get honorList => _honorList;

  void setData(int value, List repos) {
    _beStaredCount = value;
    _honorList = repos;
    notifyListeners();
  }
}
