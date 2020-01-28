import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


String promoId;
String activity;
final baseuri = "http://71.40.116.146/noizyapp";

//This is a class for building personal notifications of the user
class ListviewStateCoins {
  // This is root widget for building personal  notifications
  static Widget createList(BuildContext context, snapshotprs) {
    return ListView.builder(
        itemCount: snapshotprs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: MaterialButton(
                  child: snapshotprs[index].activity == 'pending'
                      ? Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  "${snapshotprs[index].userImage}"),
                            ),
                            title: Container(
                              child: Text(("Your ") +
                                  snapshotprs[index].category +
                                  (" promo ") +
                                  snapshotprs[index].promoName +
                                  (" in ") +
                                  (snapshotprs[index].activity)),
                            ),
                            trailing: Container(
                                height: 60,
                                width: 50,
                                child: Image.network(
                                  "${snapshotprs[index].promoLocation}",
                                  fit: BoxFit.scaleDown,
                                )),
                          ))
                      : Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  "${snapshotprs[index].userImage}"),
                            ),
                            title: Container(
                              child: Text(snapshotprs[index].name +
                                  (' ') +
                                  snapshotprs[index].activity +
                                  (' ') +
                                  snapshotprs[index].category +
                                  (" promo ") +
                                  snapshotprs[index].promoName),
                            ),
                            trailing: Container(
                                height: 60,
                                width: 50,
                                child: Image.network(
                                  "${snapshotprs[index].promoLocation}",
                                  fit: BoxFit.scaleDown,
                                )),
                          )),

                  //After on clicking notifications it checks the connections and go for fetching the promo , this is asynchronus task
                  onPressed: () async {
                    // var connectivityResult =
                    //     await (Connectivity().checkConnectivity());
                    // if (connectivityResult == ConnectivityResult.mobile ||
                    //     connectivityResult == ConnectivityResult.wifi) {
                    //   promoId = snapshotprs[index].promoId;
                    //   activity = snapshotprs[index].activity;
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (BuildContext context) => (ViewPromo())
                    //       ));
                    // } else {
                    //   print("no-conn");

                    //   Scaffold.of(context).showSnackBar(SnackBar(
                    //     content: Text("Please check your Internet Connection"),
                    //     duration: Duration(seconds: 3),
                    //   ));
                    // }
                  }));
        });
  }
}
