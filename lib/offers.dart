
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'offersAPI.dart';
import 'offers_model.dart';


String promoId;
String activity;
class ListviewStateOffers extends StatefulWidget {
  @override
  _ListviewStateOffers createState() => _ListviewStateOffers();
}

class _ListviewStateOffers extends State<ListviewStateOffers> {
  Future future;
  @override
  void initState() {
    future = fetchLatest("latest");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xFF64FFDA), const Color(0xFF009688)],
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Please check your internet connection"),
                );
              }
              var list = snapshot.data.data;
              // var listc = snapshot.data.data1;
              return BuildListview(
                list: list,
                // listc: listc,
              );
            default:
              return Text("error");
          }
        },
      ),
    );
  }
}
class BuildListview extends StatelessWidget {
  const BuildListview({
    Key key,
    @required this.list,
    // @required this.listc,
  }) : super(key: key);

  final list;
  // final listc;

  @override
  Widget build(BuildContext context) {
    return (list.length == 0)
        ? Center(
            child: Text(
            "You have no Posts here",
            style: TextStyle(color: Colors.white),
          ))
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Post(listtile: list[index]);
            });
  }
}

// this class is used to view the promos in a list along with like,comments,share and coins buttons.
class Post extends StatefulWidget {
  Post({Key key, this.listtile}) : super(key: key);
  final Datum listtile;
  // final Data1 listtileC;
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        clipBehavior: Clip.hardEdge,
        child: Card(
            margin: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0)),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.mobile ||
                        connectivityResult == ConnectivityResult.wifi) {
                      Navigator.pushNamed(context, './others/display_image',
                          arguments: widget.listtile.image);
                    } else {
                      print("no-conn");

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Please check your Internet Connection"),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  },
                  child: Container(
                      constraints: BoxConstraints.expand(
                        height: 250,
                        width: 410,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.listtile.image,
                            ),
                            fit: BoxFit.cover,
                          )),
                      ),
                ),
              
              ],
            )),
      ),
    );
  }



}
