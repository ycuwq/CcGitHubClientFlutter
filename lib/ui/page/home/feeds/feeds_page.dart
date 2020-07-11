import 'package:ccgithubclientflutter/common/provider_model.dart';
import 'package:ccgithubclientflutter/pl/model/Event.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:ccgithubclientflutter/pl/repository/event_repository.dart';
import 'package:ccgithubclientflutter/ui/widget/user/user_event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with AutomaticKeepAliveClientMixin {
  int _page = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Event> _events = List();

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

  void _onRefresh(User user) async {
    _page = 1;
    final List<Event> events =
        await EventRepository.getUserReceivedEvents(user?.login, _page);
    setState(() {
      this._events = events;
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading(User user) async {
    _page++;
    final List<Event> events =
        await EventRepository.getUserReceivedEvents(user?.login, _page);
    if (events == null || events.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _events.addAll(events);
      _refreshController.loadComplete();
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = context.watch<UserModel>().getUser();
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh: () {
          _onRefresh(user);
        },
        onLoading: () {
          _onLoading(user);
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return UserEventItem(_events[index]);
          },
          itemCount: _events.length,
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
