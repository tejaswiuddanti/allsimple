import 'package:flutter/material.dart';

class Clip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Clip();
}

class _Clip extends State<Clip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.black,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.account_box,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Text("data"),
              ],
            ),
            Column(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.open_with),
                    ),
                  ),
                ),
                Text("data"),
              ],
            ),
            Column(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.account_box,
                      ),
                    ),
                  ),
                ),
                Text("data"),
              ],
            ),
            Column(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.account_box),
                    ),
                  ),
                ),
                Text("data"),
              ],
            ),
            Column(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: InkWell(
                        splashColor: Colors.white,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.account_box,
                          ),
                        ),
                        onTap: () {}),
                  ),
                ),
                Text("data"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
