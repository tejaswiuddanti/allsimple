import 'package:flutter/material.dart';

import 'video_future.dart';
class VideoFirst extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_Video();
}
class _Video extends State<VideoFirst>{
  
   @override
  void initState() {
   fetchVideo();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
      ),
    //  body: SingleChildScrollView(
//   child: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[
//       Text(
//         'Headline',
//         style: TextStyle(fontSize: 18),
//       ),
//       SizedBox(
//         height: 200.0,
//         child: ListView.builder(
//           physics: ClampingScrollPhysics(),
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: 15,
//           itemBuilder: (BuildContext context, int index) => Card(
//                 child: Center(child: Text('Dummy Card Text')),
//               ),
//         ),
//       ),
//       Text(
//         'Demo Headline 2',
//         style: TextStyle(fontSize: 18),
//       ),
//       Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//       Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//       Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//       Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//       Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//        Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//        Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//        Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//        Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//        Card(
//         child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
//       ),
//     ],
//   ),
// ),
      body: FutureBuilder(
        future: fetchVideo(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  print("aa");
                  print(snapshot.data.data.data);
                 var  videolink=snapshot.data;
                return MaterialButton(
                  child:Text("data") ,
                  onPressed:()=>  Navigator.pushNamed(
                                  context, './video',
                                  arguments: videolink),
                                     
                );
          //         return ListView.builder(
          //             itemCount: videolink.length,
          //             itemBuilder: (context, index) {
          //                 print("videolink");
          //               print(videolink);
          //               return ListTile(
          //             title:  MaterialButton(
          //   child: Text("data"),
          //   onPressed:()=>  Navigator.pushNamed(
          //                         context, './video',
          //                         arguments: videolink),
          //                             // arguments: 'http://115.98.3.215:90/promo_application/videos/butterfly.mp4'),
          // ),
                          
                          
          //               );
          //             });
                }
             
  }
      )
      );
  }

}