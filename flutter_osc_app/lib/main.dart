import 'package:flutter/material.dart';
import 'package:flutter_osc_app/util/ThemeUtils.dart';

// 页面
import './pages/NewsListPage.dart';
import './pages/TweetsListPage.dart';
import './pages/DiscoveryPage.dart';
import './pages/MyInfoPage.dart';

// widget
import './widgets/MyDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final appBarTitles = ['资讯', '动弹', '发现', '我的'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  Color themColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  List<Widget> pages = new List();
  var tabImages;
  var _body;
  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    pages
      ..add(NewsListPage())
      ..add(TweetsListPage())
      ..add(DiscoveryPage())
      ..add(MyInfoPage());
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(primaryColor: themColor),
      home: Scaffold(
        appBar: AppBar(
            title: Text(appBarTitles[_tabIndex],
                style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white)),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: new MyDrawer(), //抽屉
      ),
    );
  }
}
