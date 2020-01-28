

import 'package:http/http.dart' as http;



import 'offers_model.dart';
String promoId;
final baseuri = "http://71.40.116.146/noizyapp";
// the purpose of this method is used to get the latest promos.
Future fetchLatest(String category) async {
  print("hello everyone");
  try {
    
    var url = baseuri + "/offers.php";

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var userId = sharedPreferences.getString("userId");
    var response =
        await http.post(url, body: {});

    return categoryFromJson(response.body);
  } catch (e) {
    print("hai");
    print(e);
  }
}


String errmsg;
setStatus(String msg) {
  errmsg = msg;
  print(errmsg);
}



