import 'dart:ui'; //引入ui库，因为ImageFilter Widget在这个里边。
import 'package:flutter/material.dart';

class imageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('毛玻璃'),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        'JSPang',
                        style: Theme.of(context).textTheme.display3, //设置比较酷炫的字体
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
