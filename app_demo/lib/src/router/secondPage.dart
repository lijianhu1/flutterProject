import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          "second page",
          style: TextStyle(fontSize: 36.0),
        ),
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
