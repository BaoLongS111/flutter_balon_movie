import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final HomeRecommendModel model;
  DetailPage({Key key, @required this.model}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    String url = widget.model.vodPlayUrl.replaceAll("第一集\$", "");
    player.setDataSource(url, autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home/bg_login.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: FijkView(player: player),
        ),
      ),
    );
  }
}
