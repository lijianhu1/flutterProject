import 'package:flutter/material.dart';
import 'package:flutter_osc_app/api/Ajax.dart';
import './Sub.dart';
class NewsListPage extends StatelessWidget {
  String result;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('红色按钮'),
              color: Colors.red,
              onPressed: () async {
                result = await Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new Sub(text:'点击')
                ));
                Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('蓝色按钮'),
              color: Colors.blue,
              onPressed: () {
                print('this is blue btn!');
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('绿色按钮'),
              color: Colors.green,
              onPressed: () {
                print('this is green btn!');
              },
            ),
          ),

        ],
      ),
    );
  }
}
