import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //VideoPlayerController _controller;
//Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network(
    //'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
    //_initializeVideoPlayerFuture = _controller.initialize();
    //_controller.setLooping(true);
    //_controller.setVolume(1.0);
    //super.initState();
  }

  //@override
  //void dispose(){
  //_controller.dispose();
  //super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    //return Scaffold(

    // appBar: AppBar(
    // title: Container(
    //   child: Column(
    //   children: [
    //   SizedBox(
    //   height: 10,
    // )//,
    //SizedBox(
    //height: 10,
    // ),
    //Center(
    //child: _controller.value.initialized
    //  ? AspectRatio(
    //aspectRatio: _controller.value.aspectRatio,
    //child: VideoPlayer(_controller),
    //)
    //  : Container(),
    //),
    //],
    //),
    //),
    //),
    //body: FutureBuilder(
    //future: _initializeVideoPlayerFuture,
    //builder: (context,snapshot){
    //if(snapshot.connectionState == ConnectionState.done){
    //return AspectRatio(
    //aspectRatio: _controller.value.aspectRatio,
    //child:CircularProgressIndicator(),
    //);
    //}
    //},
    //),
    //floatingActionButton: FloatingActionButton(
    //onPressed:(){
    //setState((){
    //if (_controller.value.isPlaying) {
    //_controller.pause();
    //}else{
    //_controller.play();
    //}});
    //},
    //child: Icon(_controller.value.isPlaying ? Icons.pause: Icons.play_arrow),

    //),
    //);
  }
}
