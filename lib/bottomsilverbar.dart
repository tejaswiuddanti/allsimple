// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// class BottomApp extends StatefulWidget {
//   @override
//   _BottomAppState createState() => _BottomAppState();
// }

// class _BottomAppState extends State<BottomApp> {
//   bool _showAppbar = true; //this is to show app bar
// ScrollController _scrollBottomBarController = new ScrollController(); // set controller on scrolling
// bool isScrollingDown = false;
// bool _show = true;
// double bottomBarHeight = 75; // set bottom bar height
// // double _bottomBarOffset = 0;
// @override
// void initState() {
//   super.initState();
//   myScroll();
// }
// @override
// void dispose() { 
//   _scrollBottomBarController.removeListener(() {});
//   super.dispose();
// }
// Widget containterContent(){
//   return Container(
//     height: 50.0,
//     color: Colors.cyanAccent,
//     margin: EdgeInsets.all(8.0),
//     width: MediaQuery.of(context).size.width - 100,
//     child: Center(child: Text('Item 1',
//       style: TextStyle(
//         fontSize: 14.0,
//       ),)),
//   );
// }

// Widget body() {
//   return ListView(
//     controller: _scrollBottomBarController,
//     children: <Widget>[
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),
//       containterContent(),

//     ],
//   );
// }
// void showBottomBar() {
//   setState(() {
//     _show = true;
//   });
// }

// void hideBottomBar() {
//   setState(() {
//     _show = false;
//   });
// }
// void myScroll() async {
//   _scrollBottomBarController.addListener(() {
//     if (_scrollBottomBarController.position.userScrollDirection ==
//         ScrollDirection.reverse) {
//       if (!isScrollingDown) {
//         isScrollingDown = true;
//         _showAppbar = false;
//         hideBottomBar();
//       }
//     }
//     if (_scrollBottomBarController.position.userScrollDirection ==
//         ScrollDirection.forward) {
//       if (isScrollingDown) {
//         isScrollingDown = false;
//         _showAppbar = true;
//         showBottomBar();
//       }
//     }
//   });
// }
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//     appBar: _showAppbar
//         ? AppBar(
//       title: Text('My Tasks'),
//     )
//         : PreferredSize(
//       child: Container(),
//       preferredSize: Size(0.0, 0.0),
//     ),
//     bottomNavigationBar: Container(
//       height: bottomBarHeight,
//       width: MediaQuery.of(context).size.width,
//       child: _show
//           ?BottomNavigationBar(
//         currentIndex: 0, // this will be set when a new tab is tapped
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.mail),
//             title: new Text('Messages'),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), title: Text('Profile'))
//         ],
//       )
//           : Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width,
//       ),
//     ),

//     body: body(
// ),

//     // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }
//   }


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class Silver extends StatefulWidget {
  Silver({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SilverState createState() => new _SilverState();
}

class _SilverState extends State<Silver> {
  ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      drawer: Container(),
      key: scaffoldKey,
      body: NestedScrollView(
        controller: _hideButtonController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Container(
                child: Card(
                  elevation: 3.0,
                  margin: EdgeInsets.only(top: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            Icons.sort,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            scaffoldKey.currentState.openDrawer();
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "What are you looking for?"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            searchController.clear();
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              elevation: 10.0,
              automaticallyImplyLeading: false,
              expandedHeight: 70,
              floating: true,
              snap: true,
            )
          ];
        },
        body: new ListView(
          children: <Widget>[
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('I realize I am crazy'),
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('And I thought I was so smart'),
            const Text('I realize I am crazy'),
          ],
        ),
      ),

      bottomNavigationBar: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: _isVisible ? 60.0 : 0.0,
        child: _isVisible
            ? AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: _isVisible ? 60.0 : 0.0,
                child: _isVisible
                    ? new BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        items: [
                          new BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            title: Text('Home'),
                          ),
                          new BottomNavigationBarItem(
                            icon: Icon(Icons.card_giftcard),
                            title: Text('Offers'),
                          ),
                          new BottomNavigationBarItem(
                            icon: Icon(Icons.account_box),
                            title: Text('Account'),
                          ),
                        ],
                        currentIndex: 0,
                      )
                    : Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                      ),
              )
            : Container(
                color: Theme.of(context).primaryColor,
                width: MediaQuery.of(context).size.width,
              ),
      ),

//                _isVisible
//                  ? bottomNavigationBar()
//                  : Container(
//                      height: 0.0,
//                      width: MediaQuery.of(context).size.width,
//                    ),
    );
  }
}