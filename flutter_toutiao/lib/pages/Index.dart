import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import '../util/ajax.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  ScrollController _newsScroll = new ScrollController();
  List<dynamic> tabs = [
    {'id': 0, 'name': '推荐', 'tag': '__all__'},
    {'id': 1, 'name': '视频', 'tag': 'video'},
    {'id': 2, 'name': '热点', 'tag': 'news_hot'},
    {'id': 3, 'name': '广州'},
    {'id': 4, 'name': '艺术'},
    {'id': 5, 'name': '减肥'},
    {'id': 6, 'name': '设计'},
    {'id': 7, 'name': '奇闻'},
    {'id': 8, 'name': '探索'},
    {'id': 9, 'name': '奢侈品'},
    {'id': 10, 'name': '羽毛球'},
    {'id': 11, 'name': '奇葩'},
  ];
  List<Widget> tabView = [];
  var listData = [];
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    getNewList(true);
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if(tabIndex != _tabController.index){
          getNewList(true);
          tabIndex = _tabController.index;
        }
        print(tabIndex);
//        getNewList(true);
      });
    });
    _newsScroll.addListener(() {
      if (_newsScroll.position.pixels == _newsScroll.position.maxScrollExtent) {
        // 滚动至底部
        getNewList(false);
      }
    });
  }

  Future _pullToRefresh() async {
    await getNewList(true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget newListView = ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, i) => renderRow(i),
      controller: _newsScroll,
    );
    tabView = tabs.map((item) {
      return RefreshIndicator(child: newListView, onRefresh: _pullToRefresh);
    }).toList();
    return Column(
      children: <Widget>[
        Container(
          child: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e['name'])).toList(),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
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
            children: tabView,
          ),
        )
      ],
    );
  }

  Map newslistParam = {
    '__all__': {
      true: {
        'tag': '__all__',
        'ac': 'wap',
        'count': '20',
        'format': 'json_raw',
        '_signature': 'pEl4PAAA-aySUsxN-JdyLaRJeC',
        'i': 1574407013,
        'as': 'A1550DADA7A8CC1',
        'cp': '5DD7881C5C71FE1',
        'min_behot_time': new DateTime.now().millisecondsSinceEpoch
      },
      false: {
        'tag': '__all__',
        'ac': 'wap',
        'count': '20',
        'format': 'json_raw',
        '_signature': 'pEl4PAAA-aySUsxN-JdyLaRJeC',
        'as': 'A1B5ADCD57D8CC9',
        'cp': '5DD758FC1C79BE1',
        'max_behot_time': 1574407013
      }
    },
    'video': {
      true: {
        'tag': 'video',
        'ac': 'wap',
        'count': 20,
        'format': 'json_raw',
        'as': 'A165CDDD477A0A8',
        'cp': '5DD7FA903A081E1',
        'min_behot_time': new DateTime.now().millisecondsSinceEpoch,
        '_signature': 'RLr-ZwAAGW5yoUoWLcIYl0S6.n',
        'i': 1574409134
      },
      false: {
        'tag': 'video',
        'ac': 'wap',
        'count': 20,
        'format': 'json_raw',
        'as': 'A1953D6D57FA121',
        'cp': '5DD73A41B2611E1',
        'max_behot_time': 1574409134,
        '_signature': 'RLr-ZwAAGW5yoUoWLcIYl0S6.n',
        'i': 1574409134
      }
    }
  };

  void getNewList(type) {
    // type ture:刷新  false: 下一页

    Map param;
    switch (tabs[tabIndex]['tag']) {
      case 'video':
        param = newslistParam['video'][type];
        break;
      default:
        param = newslistParam['__all__'][type];
        break;
    }
    Ajax.getNewList(param, (res) {
//          LogUtil.e(res['data'][0]);
      setState(() {
        if (type) {
          listData = res['data'];
        } else {
          listData.addAll(res['data']);
        }
      });
    });
  }

  Widget renderRow(int i) {
    Widget itemMainWidget;
    switch (tabs[tabIndex]['tag']) {
      case 'video':
        itemMainWidget = listData[i]['video_detail_info'] != null
            ? Column(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          listData[i]['large_image_url'],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              child: Text(
                                listData[i]['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                softWrap: true,
                                maxLines: 2,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              height: 60.0,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Color.fromRGBO(0, 0, 0, 0.4),
                                    Color.fromRGBO(0, 0, 0, 0.3),
                                    Color.fromRGBO(0, 0, 0, 0.2),
                                    Color.fromRGBO(0, 0, 0, 0.1),
                                    Color.fromRGBO(0, 0, 0, 0.0),
                                  ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            )),
                        Positioned(
                          child:Container(
                            child: Icon(
                              Icons.video_library,size: 50.0,
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0), //3像素圆角
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                          ),
                        )
                      ],
                      overflow: Overflow.visible,
                      alignment: AlignmentDirectional.center,
                    ),
                    margin: EdgeInsets.only(bottom: 10.0),
                  ),
                  Container(
                    child:Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            listData[i]['source'],
                            style: TextStyle(color: Color(0xFF999999), fontSize: 12.0),
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                        ),
                        Container(
                          child: Text(
                            "评论 ${listData[i]['repin_count']}",
                            style: TextStyle(color: Color(0xFF999999), fontSize: 12.0),
                          ),
                        )
                      ],
                    ) ,
                    margin: EdgeInsets.only(bottom: 10.0),
                  )

                ],
              )
            : null;
        break;
      default:
        // 标题
        Widget itemTitleWidget = Container(
          child: Text(
            listData[i]['title'],
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        );
        // 底部评论等信息
        Widget itemFooterWidget = Container(
          child: Row(
            children: <Widget>[
              Offstage(
                offstage: !listData[i]['is_stick'] &&
                    !(listData[i]['hot'] == 1), //这里控制
                child: Container(
                  child: Text(
                    listData[i]['is_stick']
                        ? '置顶'
                        : listData[i]['hot'] == 1 ? '热' : '',
                    style: TextStyle(
                        fontSize: 12.0, color: const Color(0xFFf85959)),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromRGBO(248, 89, 89, 0.5)),
                  ),
                  padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                  margin: EdgeInsets.only(right: 10.0),
                ),
              ),
              Container(
                child: Text(
                  listData[i]['source'],
                  style: TextStyle(color: Color(0xFF999999), fontSize: 12.0),
                ),
                margin: EdgeInsets.only(right: 10.0),
              ),
              Container(
                child: Text(
                  "评论 ${listData[i]['repin_count']}",
                  style: TextStyle(color: Color(0xFF999999), fontSize: 12.0),
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(top: 10.0),
        );
        if (listData[i]['image_list'].length == 1) {
          itemMainWidget = Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[itemTitleWidget, itemFooterWidget],
                  ),
                ),
                Container(
                  child: Image.network(
                    listData[i]['image_list'][0]['url'],
                    width: 120,
                    fit: BoxFit.fitHeight,
                  ),
                  margin: EdgeInsets.only(left: 5.0),
                  width: 120.0,
                ),
              ],
            ),
          );
        } else {
          itemMainWidget = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              itemTitleWidget,
              Offstage(
                offstage: listData[i]['image_list'].length == 0,
                child: Container(
                  child: Row(
                    children:
                        List<Widget>.from(listData[i]['image_list'].map((item) {
                      return Expanded(
                        child: Container(
                          child: Image.network(
                            item['url'],
                            width: 120,
                            fit: BoxFit.fitHeight,
                          ),
                          margin: EdgeInsets.only(right: 5.0),
                        ),
                      );
                    }).toList()),
//             children: <Widget>[],
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
              ),
              itemFooterWidget
            ],
          );
        }
        break;
    }

    return InkWell(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: itemMainWidget,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey))),
            ),
          )
        ],
      ),
      onTap: () {
        print(i);
      },
    );
  }
}
