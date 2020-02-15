import 'package:flutter/material.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double elevation; //阴影
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData prefixIcon;
  final VoidCallback onEditingComplete;

  const SearchAppBarWidget(
      {Key key,
      this.height: 56.0,
      this.elevation: 0.5,
      this.leading,
      this.actions,
      this.hintText: '请输入关键词',
      this.focusNode,
      this.controller,
      this.onEditingComplete,
      this.prefixIcon: Icons.search,
      this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SearchAppBarState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height); //这里设置控件（appBar）的高度
}

class SearchAppBarState extends State<SearchAppBarWidget> {
  bool _hasdeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new PreferredSize(
        child: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: false,
              child: buildAppBar(context, '', leading: widget.leading,title: widget.title,actions: widget.actions),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(widget.height));
  }
}

Widget buildAppBar(BuildContext context, String text,
    {double fontSize: 18.0,
    double height: 56.0,
    double elevation: 0.5,
    Widget leading,
    bool centerTitle: false,
    Widget title,
    List<Widget> actions,
    bool hasTitle:false,
    }) {
  hasTitle = title == null;
  return new PreferredSize(
      child: new AppBar(
          elevation: elevation, //阴影
          centerTitle: centerTitle,
//          title: title,
          title:!hasTitle?title: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.search,color: Colors.grey,),
                Text('搜你想搜的',style: TextStyle(color: Colors.grey),)
              ],
            ),
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(4.0)
            ),
            width: 300.0,
            height: 36.0,
            padding: EdgeInsets.only(left: 10.0),
          ),
          leading: leading,
          actions: actions),
      preferredSize: Size.fromHeight(height));
}
