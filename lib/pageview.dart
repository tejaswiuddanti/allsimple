import 'package:flutter/material.dart';
class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);

 final String title;

  @override
  _Page createState() => _Page();
}

class _Page extends State<Page> { 
  PageController controller =PageController();
      @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: PageView(
          children: <Widget>[
        Container(
          child: Text("data"),
          color: Colors.blue,

        ),
      Container(
        child: Text("data1"),
        color: Colors.white,
      )
      ],
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      pageSnapping: false,
      onPageChanged:(num){
        print("object");
        // controller.jumpToPage(2);
      }
      )
    );
 
   
  }
}