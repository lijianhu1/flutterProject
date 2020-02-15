import 'package:flutter/material.dart';

// 导入页面 组件
import './util/tool.dart';
import './widget/TopBar.dart';
import 'pages/Index.dart';
import 'pages/User.dart';
import 'util/ajax.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  int _currentIndex = 0;
  List<Widget> pagesList = new List();
  Color ThemeColor = Tool.themeColor;
  // This widget is the root of your application.
  @override
  void initState() {
    pagesList..add(IndexPage())..add(UserPage());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '今日头条',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: SearchAppBarWidget(
          actions: <Widget>[ //导航栏右侧菜单
            IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          ],
        ),
        body: pagesList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的')
            )
          ],
          selectedItemColor:Colors.red,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (int i){
            setState(() {
              _currentIndex = i;
            });
          },
        ),
      ),
    );
  }

}


