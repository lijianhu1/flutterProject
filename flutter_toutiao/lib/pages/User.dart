import 'package:flutter/material.dart';
class UserPage extends StatefulWidget {
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  int num = 0;
  List<dynamic> tabs = [
    {'id': 0, 'name': '推荐', 'tag': '__all__'},
    {'id': 1, 'name': '视频', 'tag': 'video'},
    {'id': 2, 'name': '热点', 'tag': 'news_hot'},
  ];
  List<Widget> tabView = [];
  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        num++;
        if(tabIndex!=_tabController.index){
          print(tabIndex);
          print(_tabController.index);
          tabIndex = _tabController.index;
        }

//        getNewList(true);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    tabView = tabs.map((item) {
      return Center(
        child: Text(item['name']),
      );
    }).toList();
    return Column(
      children: <Widget>[
        Container(
          child: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e['name'])).toList(),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicator: ShapeDecoration(
              shape: Border.all(color: Colors.white, width: 0)),
          ),
          decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('111--'),
                  Text('$num')
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Row(
                children: <Widget>[
                  Text('222--'),
                  Text('$num')
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Row(
                children: <Widget>[
                  Text('333--'),
                  Text('$num')
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        )
      ],
    );

  }
}
