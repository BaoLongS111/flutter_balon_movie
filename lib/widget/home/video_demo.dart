import 'package:flutter/material.dart';

class VideoDemo extends StatefulWidget {
  VideoDemo({Key key}) : super(key: key);

  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("小视频"),
      ),
    );
  }
}
