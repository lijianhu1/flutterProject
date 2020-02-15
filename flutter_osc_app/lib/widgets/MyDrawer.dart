import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // 菜单的文本
  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  // 菜单文本前面的图标
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(width: 300.0),
      child: Material(
        elevation: 16.0,
        child: ListView.separated(
            itemCount: menuTitles.length + 1,
            itemBuilder: renderRow,
            padding: const EdgeInsets.all(0.0), // 加上这一行可以让Drawer展开时，状态栏中不显示白色
            separatorBuilder: (BuildContext context, int index) {
              return index > 0 ? Divider() : Divider(color: Colors.white);
            }),
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    // 第一个图片
    if (index == 0) {
      return Container(
        width: 300.0,
        height: 300.0,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: Image.asset(
          './images/cover_img.jpg',
          width: 300.0,
          height: 300.0,
        ),
      );
    }
    return InkWell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
                child: Image.asset(menuIcons[index - 1],
                    width: 28.0, height: 28.0),
              ),
              Expanded(
                child: Text(menuTitles[index - 1]),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              )
            ],
          ),
        ),
        onTap: () {
          print(index);
        });
  }
}
