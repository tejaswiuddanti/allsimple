import 'package:dio/chiewervideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'herolist1.dart';
class HeroButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_HeroButton();
}
class _HeroButton extends State<HeroButton>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: 100,
        child: CircleAvatar(
                  child: Hero(
            tag:'profile',
            child: InkWell(
child: Icon(Icons.label_outline),
onTap: (){
  Navigator.push(context,MaterialPageRoute(
    builder:(context)=>HeroList1() 
  ));
},
            ),
          ),
        ),
      )

    );
  }

} 


