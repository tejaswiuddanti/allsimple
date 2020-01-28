import 'package:dio/dropdow.dart';
import 'package:dio/hero.dart';
import 'package:dio/loading.dart';
import 'package:dio/swiperight.dart';
import 'package:dio/video.dart';
import 'package:dio/video_first.dart';

import 'package:flutter/material.dart';
import 'bottom.dart';
import 'bottom_navi.dart';
import 'bottomsilverbar.dart';
import 'chiewervideo.dart';
import 'clipoval.dart';
import 'coins_history.dart';
import 'coinsmodel.dart';
import 'country_code.dart';
import 'date.dart';
import 'datepicker.dart';

import 'errortext.dart';
import 'filter_tabs.dart';
import 'future.dart';
import 'herolist.dart';
import 'horivertical.dart';
import 'offers.dart';
import 'pageview.dart';
import 'pop.dart';
import 'popup.dart';
import 'popupmenu.dart';
import 'referal.dart';
import 'refresh.dart';

void main() => runApp(MyApp());
Widget video =VideoFirst();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
        routes: <String, WidgetBuilder>{
      './video': (BuildContext context) => video,
        },
      home:
      // Page(),
      // Clip(),
      // HeroButton()
      // HeroAnimationRecipe(),
      // Chiewer(),
      // FlutterDemo(),
      // Referral(),
      // SwipeDetector1(),
      // BottomApp(),
      // Silver(),
    //  VideoFirst(),
    // VideoApp(),
      // NavToNewpagePopupMenu(),
      // BasicAppBarSample(),
      // HomeText(),
      // BasicDateField(),
      // DatePage(),
      // Date(),
      // CustomNavi(),
      // CountryCode(),
      // DropDown(),
      // MultipleFut()
      
      
      // LetsParty(),
      // MyHomePage1(),
      // Loading(),
      // SwipeToRefreshExample(),
      //  MyHomePage(title: 'Flutter Demo Home Page'),/./////
      FilterTabs()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

 

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin {
//   var fetch = fetchPost();
//   TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();

//     tabController.addListener(_handleTabSelection);
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.tealAccent,
//           bottom: TabBar(
//             indicatorColor: Color(0xFF002A60),
//             indicatorSize: TabBarIndicatorSize.label,
//             controller: tabController,
//             tabs: <Widget>[
//               // This is a personal tab for showing personal informations or notification
//               Tab(
//                   child: Text(
//                 "COINS HISTORY",
//                 style: TextStyle(
//                     color: tabController.index == 0
//                         ? Color(0xFF002A60)
//                         : Colors.white),
//               )),
//               // This is a friends tab for showing friends informations or notifications
//               Tab(
//                   child: Text(
//                 "OFFERS",
//                 style: TextStyle(
//                     color: tabController.index == 1
//                         ? Color(0xFF002A60)
//                         : Colors.white),
//               )),
//             ],
//           ),
//           title: Text(
//             'EARN COINS',
//             style: TextStyle(color: Color(0xFF002A60)),
//             textAlign: TextAlign.center,
//           ),
//         ),

//         // Body contain main heart of the notification in which here we are using future builder for calling API connecting method.
//         body: FutureBuilder(
//             future: fetch,
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   return (Text("No internet connection"));
//                 case ConnectionState.waiting:
//                   return Center(child: CircularProgressIndicator());
//                 default:
//                   if (snapshot.hasData) {
//                     return TabBarView(
//                         controller: tabController,
//                         children: <Widget>[
//                           //In this container we are calling personal notificatons tab
//                           new Container(
//                               child: ListviewStateCoins.createList(
//                                   context, snapshot.data.personal)),

//                           //In this container we are calling friends notificatons tab
//                           new Container(
//                             child: ListviewStateOffers(),
//                           ),
//                         ]);
//                   } else {
//                     return Center(
//                       child: Text("Please check your internet connection"),
//                     );
//                   }
//               }
//             }),
//       ),
//     );
//   }
// }







