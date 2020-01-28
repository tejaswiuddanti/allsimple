import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


//here we are calling method from post class which accepts response from the API
Post postFromJson(String str) => Post.fromJson(json.decode(str));
String errmsg;

//this a post class for communicating with the API
class Post {
  List<Personal> personal;
  List<Friend> friends;
  //this is a constructor  for accepting response
  Post({
    this.personal,
    this.friends,
  });
  //this is a factory method for converting data from json formate to the normal format
  factory Post.fromJson(Map<String, dynamic> json) => new Post(
        personal: new List<Personal>.from(
            json["personal"].map((x) => Personal.fromJson(x))),
        friends: new List<Friend>.from(
            json["friends"].map((x) => Friend.fromJson(x))),
      );
}

//This is a Friends which accepts all the data presents in the  variable friends of list type
class Friend {
  //these are the variable for accepting response from the variable friends
  String promoId;
  String promoName;
  String promoLocation;
  String category;
  String followerName;
  String followerImage;
  DateTime time;
  String activity;
  //This is a constructor for accepting response form the friends varible
  Friend({
    this.promoId,
    this.promoName,
    this.promoLocation,
    this.category,
    this.followerName,
    this.followerImage,
    this.time,
    this.activity,
  });
  //This is factory method for conversion of data from json to normal format
  factory Friend.fromJson(Map<String, dynamic> json) => new Friend(
      promoId: json["promoId"],
      promoName: json["promoName"],
      promoLocation:
          json["promoLocation"] == null ? "NA" : json["promoLocation"],
      category: json["category"],
      followerName: json["followerName"],
      followerImage:
          json["followerImage"] == null ? "NA" : json["followerImage"],
      time: DateTime.parse(json["time"]),
      activity: json["activity"]);
}

//This is a Pesonal which accepts all the data presents in the  variable personal of list type
class Personal {
  String promoId;
  String promoName;
  String category;
  String promoLocation;
  String name;
  String userImage;
  DateTime activityTime;
  String activity;
//This is a constructor for accepting response form the personal varible
  Personal({
    this.promoId,
    this.promoName,
    this.category,
    this.promoLocation,
    this.name,
    this.userImage,
    this.activityTime,
    this.activity,
  });
  //This is factory method for conversion of data from json to normal format
  factory Personal.fromJson(Map<String, dynamic> json) => new Personal(
        promoId: json["promoId"],
        promoName: json["promoName"],
        category: json["category"],
        promoLocation:
            json["promoLocation"] == null ? "NA" : json["promoLocation"],
        name: json["name"] == null ? "NA" : json["name"],
        userImage: json["userImage"] == null ? "NA" : json["userImage"],
        activityTime: DateTime.parse(json["activityTime"]),
        activity: json["activity"],
      );
}

setStatus(String msg) {
  errmsg = msg;
  print(errmsg);
}
final baseuri = "http://71.40.116.146/noizyapp";
//This is future method for communicating with the API and get data from the API
Future fetchPost() async {
  //This is a sharedPreference value which is used for fetching data of the perticular user
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // var userId = sharedPreferences.getString("userId");
  try {
    final response = await http.post(
        baseuri + "/notifications.php",
        body: {'userId': "2"});
    return Post.fromJson(json.decode(response.body));
  } on CastError catch (e) {
    setStatus(e.toString());
  }
}
