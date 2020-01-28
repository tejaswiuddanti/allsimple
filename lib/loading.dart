import 'dart:async';

import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  Loading({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Loading createState() => new _Loading();
}

class _Loading extends State<Loading> with TickerProviderStateMixin {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("load"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                },
                elevation: 4.0,
                minWidth: double.infinity,
                height: 48.0,
                color: Colors.lightGreen,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Click Here",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}