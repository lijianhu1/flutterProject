import 'package:flutter/material.dart';
class Sub extends StatelessWidget{
  Sub({Key key, this.text}):super(key:key);
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child:RaisedButton(
          child:Text(text),
          onPressed: (){
            Navigator.pop(context,'返回值123');
          },
        )
    );
  }
}
