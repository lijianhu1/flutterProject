import 'package:flutter/material.dart';
class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('分享');
            },
          ),
        ],
      ),
      body: HomeContent(),
    );
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1),
        child: ListView(
          children: <Widget>[
            ProductItem('item1', '描述1',
                'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
            ProductItem('item2', '描述2',
                'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg'),
            ProductItem('item3', '描述3',
                'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg'),
          ],
        ));
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  ProductItem(this.title, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.red)),
      child: Column(children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 26),
        ),
        Image.network(imageUrl),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            desc,
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}
