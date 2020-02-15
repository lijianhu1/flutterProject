import 'package:flutter/material.dart';

Map<String,Object> guShi = {
  'author': '苏轼',
  'title': '定风波',
  'text': '莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。'
};
class UserPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserPageWidgetState();
  }
}

class UserPageWidgetState extends State<UserPageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
        ),
        body: new UserContent(),
        // body: Text.rich(
        //   TextSpan(
        //     children: [
        //       TextSpan(text: GuShi['title'],style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
        //       TextSpan(text: GuShi['author']),
        //       TextSpan(text: GuShi['text']),
        //     ],
        //   ),
        //   style: TextStyle(fontSize: 20, color: Colors.purple),
        // )
        );
  }
}

class UserContent extends  StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          child: TextContainer(),
        ),
        Container(
          child: buttonContainer(),
        ),
        // Container(
        //   child: FormDemo(),
        // )
      ],
    );
  }
}

class TextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Text.rich(TextSpan(
              children: [
                TextSpan(text: guShi['title'],style: TextStyle(fontSize: 16)),
                TextSpan(text: ' '),
                TextSpan(text:guShi['author'],style: TextStyle(fontSize: 12))
              ]
            )),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(guShi['text']),
          ),
        )
      ],
    );
  }
}

class buttonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.share),
          onPressed: (){
            print('FloatingActionButton');
          },
          ),
          RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton Click");
          },
        ),
        FlatButton(
          child: Text("FlatButton"),
          onPressed: () {
            print("FlatButton Click");
          },
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () {
            print("OutlineButton Click");
          },
        )
      ],
    );
  }
}

// class FormContainer extends StatefulWidget {
//   @override
//   FormState createState()=>FormState()
// }
// class FormState extends state<FormContainer> {
//   @override
// }

