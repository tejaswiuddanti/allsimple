// import 'package:flutter/material.dart';




// class FilterTabs extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() =>FilterTabsState();
// }

// class FilterTabsState extends State<FilterTabs> {
// @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             leading: Icon(Icons.person_outline),
//             title: Text('DASHBOARD',style: TextStyle(fontSize: 16.0),),
//             bottom: PreferredSize(
//                 child: TabBar(
//                     isScrollable: true,
//                     unselectedLabelColor: Colors.white.withOpacity(0.3),
//                     indicatorColor: Colors.white,
//                     tabs: [
//                       Tab(
//                         child: Text('Tab 1'),
//                       ),
//                       Tab(
//                         child: Text('Investment'),
//                       ),
//                       Tab(
//                         child: Text('Your Earning'),
//                       ),
//                       Tab(
//                         child: Text('Current Balance'),
//                       ),
//                       Tab(
//                         child: Text('Tab 5'),
//                       ),
//                       Tab(
//                         child: Text('Tab 6'),
//                       )
//                     ]),
//                 preferredSize: Size.fromHeight(30.0)),
//             actions: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Icon(Icons.add_alert),
//               ),
//             ],
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               Container(
//                 child: Center(
//                   child: Text('Tab 1'),
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text('Tab 2'),
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text('Tab 3'),
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text('Tab 4'),
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text('Tab 5'),
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text('Tab 6'),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

// }




import 'package:flutter/material.dart';



class AppRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class RouteState {
  RouteState({this.name: AppRoutes.root});
  String name;
  // One navigator for each route
  final navigatorKey = GlobalKey<NavigatorState>();
}

class FilterTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterTabsState();
}

class FilterTabsState extends State<FilterTabs> with NavigatorObserver {
  TabItem currentTab = TabItem.red;
  Map<TabItem, RouteState> routes = {
    TabItem.red: RouteState(),
    TabItem.green: RouteState(),
    TabItem.blue: RouteState(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _push() async {
    print('push ${TabHelper.description(currentTab)}');
    routes[currentTab].name = AppRoutes.detail;
    await routes[currentTab]
        .navigatorKey
        .currentState
        .pushNamed(AppRoutes.detail);
    routes[currentTab].name = AppRoutes.root;
    print('pop ${TabHelper.description(currentTab)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        currentTab: currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }

  Widget _buildBody() {
    return MaterialApp(
      navigatorKey: routes[currentTab].navigatorKey,
      // adding this line causes an exception when tapping on the `green` tab:
      // flutter: 'package:flutter/src/widgets/navigator.dart': Failed assertion: line 1209 pos 14:
      // flutter: 'observer.navigator == null': is not true.
      navigatorObservers: [this],
      theme: ThemeData(
        primarySwatch: TabHelper.color(currentTab),
      ),
      initialRoute: routes[currentTab].name,
      routes: {
        AppRoutes.root: (context) => MasterPage(
              color: TabHelper.color(currentTab),
              title: TabHelper.description(currentTab),
              onPush: _push,
            ),
        AppRoutes.detail: (context) => DetailPage(),
      },
    );
  }
}

enum TabItem {
  red,
  green,
  blue,
}

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.red;
      case 1:
        return TabItem.green;
      case 2:
        return TabItem.blue;
    }
    return TabItem.red;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return 'red';
      case TabItem.green:
        return 'green';
      case TabItem.blue:
        return 'blue';
    }
    return '';
  }

  static IconData icon(TabItem tabItem) {
    return Icons.layers;
  }

  static MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Colors.red;
      case TabItem.green:
        return Colors.green;
      case TabItem.blue:
        return Colors.blue;
    }
    return Colors.grey;
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.red),
        _buildItem(tabItem: TabItem.green),
        _buildItem(tabItem: TabItem.blue),
      ],
      onTap: (index) => onSelectTab(
            TabHelper.item(index: index),
          ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? TabHelper.color(item) : Colors.grey;
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class MasterPage extends StatelessWidget {
  MasterPage({this.color, this.title, this.onPush});
  final Color color;
  final String title;
  final VoidCallback onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
          backgroundColor: color,
        ),
        body: Container(
          color: color,
          alignment: Alignment.center,
          child: FlatButton(
            child: Text(
              'PUSH',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
            onPressed: onPush,
          ),
        ));
  }
}