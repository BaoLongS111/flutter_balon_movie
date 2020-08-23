import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("demo"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text("小视频"),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fijkplayer/fijkplayer.dart';

// class VideoPage extends StatefulWidget {
//   VideoPage({Key key}) : super(key: key);

//   @override
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   final FijkPlayer player = FijkPlayer();

//   @override
//   void initState() {
//     super.initState();
//     player.setDataSource(
//         "https://video.jializyw.com:8800/20200726/jta5mLhR/index.m3u8",
//         autoPlay: true);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     player.release();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text("demo"),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: FijkView(player: player),
//       ),
//     );
//   }
// }
