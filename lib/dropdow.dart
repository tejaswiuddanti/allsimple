import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class DropDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MyHomePageState(); 
   

}
class _MyHomePageState extends State<DropDown> {
String _mySelection;
Future future;
List list;
  // List<Map> _myJson = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];
void initState() {
    super.initState();

    future = addVehicles("customer");
  }
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
        body: Container(
          child: Center(
            child: FutureBuilder(
              future: future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    case ConnectionState.none:
                 case ConnectionState.done:
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "Please check your internet connection",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black87,
                              fontSize: 12),
                        ),
                      );
                    } 
                list=snapshot.data.data;
                return  DropdownButton<String>(
                  isDense: true,
                  hint: new Text(list[0].cus),
                  value: _mySelection,
                  onChanged: (String newValue) {

                    setState(() {
                      _mySelection = newValue;
                    });

                    print (_mySelection);
                  },
                  items: list.map(( map) {
                    return new DropdownMenuItem<String>(
                      value: map.cus.toString(),
                      child: new Text(
                        map.cus,
                      ),
                    );
                  }).toList(),
                );
                default:
            return CircularProgressIndicator();
              }
              }
            ),
          )
            
          
        ),
      );

  }
}


//   Car _selectedCar;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("widget.title"),
//         ),
//         body: Center(child: getDropDown()));
//   }

//   Widget getDropDown() {
//     var cars = Car.getCars();
//     this._selectedCar = cars.first; // Default to first value in list.
//     var items = cars.map((car) {
//       return new DropdownMenuItem(
//         value: car,
//         child: new Text(car.make),
//       );
//     }).toList();

//     return DropdownButton(
//         value: this._selectedCar,
//         onChanged: (Car car) {
//           setState(() {
//             this._selectedCar = car;
//           });
//         },
//         items: items);
//   }
// }
// class Car {
//   int id;
//   String make;

//   Car(this.id, this.make);

//   static List<Car> getCars() {
//     var cars = new List<Car>();
//     cars.add(Car(1, "Ford"));
//     cars.add(Car(2, "Toyota"));
//     cars.add(Car(3, "BMW"));

//     return cars;
//   }
// }




Future addVehicles(String action) async {
  print("addveh");
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    var url = Strings.baseurl + 'spinner.php';
    try {
      var response = await http.post(
        url,
        body: {
          'action':action,
          'crop_code':Strings.corp_code
        },
      ).timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(Strings.poorNetworkMessage);
      });
      if (response.statusCode == 200) {
        print("AddVehicle"+response.body);
        return addVehicleCustomerResponseFromJson(response.body);
      } else {
        print('error ' + response.statusCode.toString());
        return Strings.somethingWentWrongError;
      }
    } on SocketException {
      return Strings.noNetworkMessage;
    } on TimeoutException {
      return Strings.poorNetworkMessage;
    } on TypeError {
      print('typeCasting went wrong');
      return Strings.somethingWentWrongError;
    } catch (exception) {
      print(exception);
      return Strings.somethingWentWrongError;
    }
  }
  return Strings.noNetworkMessage;
}



class Strings {
static const String baseurl = 'http://115.98.3.215:90/sRamapptest/';//testing url
static const String noNetworkMessage = 'Internet Connection Not Available';
static const String poorNetworkMessage = 'Poor Internet Connection';
static const String somethingWentWrongError =
'Sorry ! Something went wrong. Try again later';
static const String True='true';
static const String False='false';
static const String corp_code='sram';
static const String customerId ='34';

// }
static const String user_type='admin';
static const String sramProducts='sramProducts';
static const String durgaProducts='durgaProducts';
}

// String corp_code='sram';
// String user_type='admin';





AddVehicleCustomerResponse addVehicleCustomerResponseFromJson(String str) => AddVehicleCustomerResponse.fromJson(json.decode(str));

String addVehicleCustomerResponseToJson(AddVehicleCustomerResponse data) => json.encode(data.toJson());

class AddVehicleCustomerResponse {
    String status;
    String message;
    List<Datum> data;

    AddVehicleCustomerResponse({
        this.status,
        this.message,
        this.data,
    });

    factory AddVehicleCustomerResponse.fromJson(Map<String, dynamic> json) => AddVehicleCustomerResponse(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String cus;

    Datum({
        this.cus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cus: json["cus"],
    );

    Map<String, dynamic> toJson() => {
        "cus": cus,
    };
}
