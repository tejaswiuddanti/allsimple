import 'dart:async';


import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  //  final String  videolink;
  // VideoApp({Key key, @required this. videolink}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoApp> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
  //  fetchVideo();
    
      
    _controller = VideoPlayerController.network(
   
      'http://115.98.3.215:90/promo_application/videos/butterfly.mp4',
    );
   

    _initializeVideoPlayerFuture = _controller.initialize();

    
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
   
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   var link=ModalRoute.of(context).settings.arguments;
   print("hh");
   print(link);
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              
              child: VideoPlayer(_controller),
            );
          } else {
            
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      
          setState(() {
          
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              
              _controller.play();
            }
          });
        },
       
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), 
    );
  }
}