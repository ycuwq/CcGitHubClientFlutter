import 'package:ccgithubclientflutter/common/provider_model.dart';
import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/Event.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:ccgithubclientflutter/pl/repository/event_repository.dart';
import 'package:ccgithubclientflutter/pl/repository/repo_repository.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_base_info.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_contribution_chart.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  final HonorModel honorModel = HonorModel();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Event> events = List();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  void _getHonor() async {
    var honor = await RepoRepository.findUserRepoAndStarred(null);
    honorModel.setData(honor.starred, honor.repos);
  }

  void _onRefresh() async {
    _getHonor();
    final User user = context.read<UserModel>().getUser();
    final List<Event> events = await EventRepository.getUserEvents(user?.login);

    _refreshController.refreshCompleted();
    setState(() {
      this.events = events;
    });
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = context.watch<UserModel>().getUser();
    final localizations = S.of(context);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _renderUserCard(context, user, localizations),
                  Container(
                    child: UserContributionChart(user),
                    margin: EdgeInsets.only(bottom: 10.0),
                  )
                  ,
                ],
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (c, i) => UserEventItem(events[i]),
                childCount: events.length,
              ),
            )
          ],
        ));
  }

  _renderUserCard(context, User user, S localizations) {
    return Card(
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
                  return _renderBottomItem(context, localizations.honor,
                      honorModel._beStaredCount?.toString() ?? "---", () {});
                },
              ),
            )
          ],
        ),
      ],
    ));
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

  @override
  bool get wantKeepAlive => true;
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
