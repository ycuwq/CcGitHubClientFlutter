import 'package:ccgithubclientflutter/generated/l10n.dart';
import 'package:ccgithubclientflutter/page/home/feeds/feeds_page.dart';
import 'package:ccgithubclientflutter/page/home/my/my_page.dart';
import 'package:ccgithubclientflutter/page/home/treed/treed_page.dart';
import 'package:ccgithubclientflutter/pl/repository/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String ROUTE_NAME = "home";

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  var _pageController = new PageController(initialPage: 0);
  int _currentPageIndex = 0;

  var pageList = [
    FeedsPage(),
    TreedPage(),
    MyPage(),
  ];
  List<Widget> titleList;

  List<Widget> getTitleList(S localizations) {

    if (titleList == null) {
      titleList = [
        Text(localizations.feeds),
        Text(localizations.trend),
        Text(localizations.my)
      ];
    }

    return titleList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    UserRepository.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = S.of(context);
    return Scaffold(
      appBar: new AppBar(
        title: getTitleList(appLocalizations)[_currentPageIndex],
      ),
      body: PageView.builder(
          onPageChanged: _pageChange,
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return pageList[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), title: Text(appLocalizations.feeds)),
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              title: Text(appLocalizations.trend)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text(appLocalizations.my))
        ],
        currentIndex: _currentPageIndex,
        onTap: onTap,
      ),
    );
  }

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }
}
