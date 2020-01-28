import "package:flutter/material.dart";

class LetsParty extends StatefulWidget {
  @override
  _LetsPartyState createState() => new _LetsPartyState();
}

class _LetsPartyState extends State<LetsParty> {
  Image _partyImage = new Image.network(
      "http://www.freshcardsgifts.co.uk/images/_lib/animal-party-greetings-card-3003237-0-1344698261000.jpg");

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<List> list = [
    ["Pina Colada",
    "Bloody Mary",
    "Strawberry Flush",
    "Mango Diver",
    "Peach Delight"
    ],
    [
      "Absolute",
      "Smirnoff",
      "White Mischief",
      "Romanov",
      "Blender's Pride"
    ]
  ];

List<String > visibleList;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(title: new Text("Let's Party"),),
      body: new ListView(
        // shrinkWrap: true,
        children: <Widget>[


          new Container (
              height: 150.0,
              child: new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2, //add the length of your list here
                  itemBuilder: (BuildContext context, int index) {
                    return new Column(
                      children: <Widget>[

                        ///Flexible let's your widget flex in  the given space, dealing with the overflow you have
                        //  new Flexible(child: new FlatButton(onPressed: ()=>print("You pressed Image No.$index"), child: _partyImage)),
                        new Flexible (child: new Container(
                            child: new FlatButton(onPressed: () {
                              scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text(
                                          "You pressed Image No.$index")));

                              setState(() {
                                visibleList = list[index];
                              });
                            },
                                child: _partyImage),
                            width: 100.0,
                            height: 100.0
                        ),),
                        //Exact width and height, consider adding Flexible as a parent to the Container
                        new Text("Text$index"),
                      ],
                    );
                  })),

          new Column(children: visibleList==null?new List():new List.generate(5, (int i) => new ListTile(title: new Text(visibleList[i]),
              onTap: () =>
                  scaffoldKey.currentState.showSnackBar(new SnackBar(
                    content: new Text("Your choise is ${visibleList[i]}"),)),
            )))
        ],),);
  }
}