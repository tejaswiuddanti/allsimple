

import 'package:dio/video_model.dart';
import 'package:http/http.dart' as http;





final baseuri = "http://115.98.3.215:90/promo_application";
// the purpose of this method is used to get the latest promos.
Future fetchVideo() async {
  print("hello everyone");
  try {
    
    var url = baseuri + "/video_getting.php";

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var userId = sharedPreferences.getString("userId");
    var response =
        await http.post(url, body: {});
print(response.body);
    return videogetFromJson(response.body);
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



