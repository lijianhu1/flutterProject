// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 导入页面
import 'home.dart';
import 'user.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainWidgetState();
  }
}

class MainWidgetState extends State<MainWidget> {
  int _currentIndex = 1;
  List<Widget> pages = new List();
  @override
  void initState() {
    pages
    ..add(HomePageWidget())
    ..add(UserPageWidget());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(pages);
    /*
    返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容
     */

    return new Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: new Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: new Text('我的')),
        ],
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}
