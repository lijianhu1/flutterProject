import 'package:flutter/material.dart';
import 'src/bottomBar/bottomBar.dart';
import 'src/router/firstPage.dart';
import 'src/imagePage//image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'app demos',
        home: new Scaffold(
          appBar: AppBar(
            title: Text("app demos"),
          ),
          body: NavigatorList(),
        ));
  }
}

class NavigatorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        pagesItem(name: '底部导航', link: new BottomNavigationWidget()),
        pagesItem(name: '路由动画', link: new RouterPageWidget()),
        pagesItem(name: '毛玻璃', link: new imageWidget()),
      ],
    );
  }
}

class pagesItem extends StatelessWidget {
  pagesItem({Key key, this.name, this.link}) : super(key: key);
  String name;
  final link;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading: new Icon(Icons.bookmark),
          title: new Text('$name'),
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => link),
            );
          }),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.lightBlue))),
    );
  }
}
