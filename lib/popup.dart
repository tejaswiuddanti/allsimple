import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PageEnum {
  firstPage,
  secondPage,
}

class NavToNewpagePopupMenu extends StatefulWidget {
  @override
  NavToNewpagePopupMenuState createState() {
    return new NavToNewpagePopupMenuState();
  }
}

class NavToNewpagePopupMenuState extends State<NavToNewpagePopupMenu> {
  _onSelect(PageEnum value) {
    // switch (value) {
    //   case PageEnum.firstPage:
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context) => FirstPage()));
        // break;
    //   case PageEnum.secondPage:
    //     Navigator.of(context).push(CupertinoPageRoute(
    //         builder: (BuildContext context) => SecondPage()));
    //     break;
    //   default:
    //     Navigator.of(context).push(CupertinoPageRoute(
    //         builder: (BuildContext context) => SecondPage()));
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigate to new page PopupMenuButton Example"),
        ),
        body: Center(
          child: PopupMenuButton<PageEnum>(
            onSelected: _onSelect,
            // child: Text("Show Popup Menu"),
            itemBuilder: (context) => <PopupMenuEntry<PageEnum>>[
                  PopupMenuItem<PageEnum>(
                    value: PageEnum.firstPage,
                    child: Text("Goto First Page"),
                  ),
                  PopupMenuItem<PageEnum>(
                    value: PageEnum.secondPage,
                    child: Text("Goto Second Page"),
                  ),
                ],
          ),
        ));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Page"),
//       ),
//     );
//   }
// }