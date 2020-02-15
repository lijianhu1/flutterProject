import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部导航demo"),
      ),

      /*  bottomNavigationBar: BottomNavigationBar(
          //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text('商业')),
            BottomNavigationBarItem(icon: Icon(Icons.mood), title: Text('我的')),
          ],
          currentIndex: _currentIndex,
          onTap: (int i) => {
                setState(() {
                  _currentIndex = i;
                })
              },
          type: BottomNavigationBarType.fixed),    // 正常导航  */

      // 不规则导航
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home), color: Colors.white, onPressed: () {}),
            IconButton(
                icon: Icon(Icons.airport_shuttle),
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
