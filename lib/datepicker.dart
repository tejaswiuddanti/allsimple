import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// // ...

// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: Container(
//         child: Column(children: <Widget>[
//           Text('Basic date field (${format.pattern})'),
//           DateTimeField(
//             format: format,
//             onShowPicker: (context, currentValue) {
//               return showDatePicker(
//                   context: context,
//                   firstDate: DateTime(1900),
//                   initialDate: currentValue ?? DateTime.now(),
//                   lastDate: DateTime(2100));
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class DatePage extends StatefulWidget {
  

  

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<DatePage> {
//   DateTime selectedDate = DateTime.now();
//   DateTime selected = DateTime.now();

//   Future<Null> _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: selected,
//         lastDate: DateTime(10000));
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//       print(selectedDate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("widget.title"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text("${selectedDate.toLocal()}"),
//             SizedBox(height: 20.0,),
//             RaisedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select date'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



class DatePage extends StatefulWidget {
 DatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<DatePage> {
 var now = new DateTime.now();
//  var now1 = new DateTime.now();
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Column(
        children: <Widget>[
          Text("${now.toLocal()}"),
          RaisedButton(
            child: new Text("Pick Date"),
            onPressed:()=> _handleDateSelection(context)
            
          ),
        ],
      )
     
    );
  }

  Future _handleDateSelection(BuildContext context)async  {
    var now = new DateTime.now();
     var date=await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2200
       )
       
    );
   print(date);
setState(() {
        now = date;
      });
     print(DateFormat('yyyy-MMMM-dd').format(now)); 
  }
}
