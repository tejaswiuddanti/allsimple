import 'package:flutter/material.dart';



class FlutterDemo extends StatelessWidget {
  FlutterDemo({Key key}) : super(key: key);

  void push(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new OtherRoute();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Demo"), actions: [
          
          new PopupMenuButton(onSelected: (String item) {
            push(context);
          }, itemBuilder: (BuildContext context) {
            return [
              new PopupMenuItem(value: "push", child: new Text("push route"))
            ];
          })
        ]),
        body: new Column(children: [
         
          new PopupMenuButton(onSelected: (String item) {
            push(context);
          }, itemBuilder: (BuildContext context) {
            return [
              new PopupMenuItem(value: "push", child: new Text("push route"))
            ];
          })
        ]));
  }
}

class OtherRoute extends StatelessWidget {
  OtherRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("other route")),
        body: new Center(child: new Text("push route")));
  }
}