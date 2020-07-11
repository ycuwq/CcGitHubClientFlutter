import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/pl/model/Trending.dart';
import 'package:ccgithubclientflutter/pl/repository/repo_repository.dart';
import 'package:ccgithubclientflutter/ui/widget/gsy_card_item.dart';
import 'package:ccgithubclientflutter/ui/widget/gsy_sliver_header_delegate.dart';
import 'package:ccgithubclientflutter/ui/widget/trending/trending_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Trending> list = List();
  TrendingTypeModel timeSelected;
  TrendingTypeModel languageSelected;

  @override
  void initState() {
    super.initState();
    showRefreshLoading();
  }

  showRefreshLoading() {
    new Future.delayed(const Duration(milliseconds: 500), () {
      _refreshController.requestRefresh(needMove: true, duration: Duration(milliseconds: 600));
      return true;
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      timeSelected = _timeType(context)[0];
      languageSelected = _languageType(context)[0];
    });
  }

  void _onRefresh() async {
    var list = await RepoRepository.getTrendRepos(
        languageSelected?.value, timeSelected?.value);
    setState(() {
      this.list = list;
    });

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final localizations = S.of(context);
    print("build trending size : ${list.length}");
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: GSYSliverHeaderDelegate(
                  maxHeight: 65,
                  minHeight: 65,
                  changeSize: true,
                  snapConfig: FloatingHeaderSnapConfiguration(
                    vsync: this,
                    curve: Curves.bounceInOut,
                    duration: const Duration(milliseconds: 10),
                  ),
                  builder: (BuildContext context, double shrinkOffset,
                      bool overlapsContent) {
                    var lr = 10 - shrinkOffset / 65 * 10;
                    var radius = Radius.circular(4 - shrinkOffset / 65 * 4);
                    return SizedBox.expand(
                        child: Padding(
                      padding: EdgeInsets.only(
                          top: lr, bottom: 15, left: lr, right: lr),
                      child: _renderHeader(localizations, radius),
                    ));
                  }),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (c, i) => TrendingItem(list[i]),
                childCount: list.length,
              ),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;

  Widget _renderHeader(S localizations, Radius radius) {
    return GSYCardItem(
        margin: EdgeInsets.all(0.0),
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radius),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
          child: Row(
            children: [
              _renderSpinner(
                  languageSelected.name ?? localizations.trending_all,
                  _languageType(context), (value) {
                setState(() {
                  languageSelected = value;
                });
                _refreshController.requestRefresh();
              }),
              _renderSpinner(timeSelected.name ?? localizations.trending_all,
                  _timeType(context), (value) {
                setState(() {
                  timeSelected = value;
                });
                _refreshController.requestRefresh();
              })
            ],
          ),
        ));
  }

  _renderSpinner(String title, List<TrendingTypeModel> trendingModelList,
      PopupMenuItemSelected<TrendingTypeModel> onSelected) {
    return Expanded(
        child: PopupMenuButton<TrendingTypeModel>(
      child: Container(
//            padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
        child: Center(
          child: Text(title),
        ),
      ),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return _renderPopItemChild(trendingModelList);
      },
    ));
  }

  List<PopupMenuEntry<TrendingTypeModel>> _renderPopItemChild(
      List<TrendingTypeModel> trendingModelList) {
    List<PopupMenuEntry<TrendingTypeModel>> list = new List();
    for (TrendingTypeModel item in trendingModelList) {
      list.add(PopupMenuItem<TrendingTypeModel>(
        value: item,
        child: new Text(item.name),
      ));
    }
    return list;
  }

  List<TrendingTypeModel> _languageType(BuildContext context) {
    final localizations = S.of(context);
    return [
      TrendingTypeModel(localizations.trending_all, null),
      TrendingTypeModel("Java", "Java"),
      TrendingTypeModel("Kotlin", "Kotlin"),
      TrendingTypeModel("Dart", "Dart"),
      TrendingTypeModel("Objective-C", "Objective-C"),
      TrendingTypeModel("Swift", "Swift"),
      TrendingTypeModel("JavaScript", "JavaScript"),
      TrendingTypeModel("PHP", "PHP"),
      TrendingTypeModel("Go", "Go"),
      TrendingTypeModel("C++", "C++"),
      TrendingTypeModel("C", "C"),
      TrendingTypeModel("HTML", "HTML"),
      TrendingTypeModel("CSS", "CSS"),
      TrendingTypeModel("Python", "Python"),
      TrendingTypeModel("C#", "c%23"),
    ];
  }

  List<TrendingTypeModel> _timeType(BuildContext context) {
    final localizations = S.of(context);
    return [
      TrendingTypeModel(localizations.trending_day, "daily"),
      TrendingTypeModel(localizations.trending_week, "weekly"),
      TrendingTypeModel(localizations.trending_month, "monthly"),
    ];
  }
}

class TrendingTypeModel {
  final String name;
  final String value;

  TrendingTypeModel(this.name, this.value);
}
