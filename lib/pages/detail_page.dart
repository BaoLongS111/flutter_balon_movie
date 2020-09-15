import 'package:balon_movie/common/utils/date_format.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/config/custom_fijkplayer.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/widget/detail/detail_widget.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final HomeRecommendModel model;
  DetailPage({Key key, @required this.model}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
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
    super.build(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home/bg_login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              width: ScreenAdaper.setWidth(1080),
              height: ScreenAdaper.setHeight(510),
              child: FijkView(
                color: Colors.black,
                fsFit: FijkFit.fill,
                player: player,
                panelBuilder: (FijkPlayer player, FijkData data,
                    BuildContext context, Size viewSize, Rect texturePos) {
                  /// 使用自定义的布局
                  return CustomFijkWidgetBottom(
                    player: player,
                    buildContext: context,
                    viewSize: viewSize,
                    texturePos: texturePos,
                  );
                },
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.setWidth(20),
                        ScreenAdaper.setWidth(40),
                        ScreenAdaper.setWidth(20),
                        ScreenAdaper.setWidth(40),
                      ),
                      child: Image.asset("assets/images/home/box_banner.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.setWidth(40),
                        0,
                        ScreenAdaper.setWidth(40),
                        ScreenAdaper.setHeight(24),
                      ),
                      child: Text(
                        widget.model.vodName,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenAdaper.setSp(46),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: ScreenAdaper.setWidth(30),
                      ),
                      height: ScreenAdaper.setHeight(50),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/detail/icon_pf.png",
                            height: ScreenAdaper.setWidth(35),
                            width: ScreenAdaper.setWidth(35),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(5),
                          ),
                          Text(
                            widget.model.vodScore.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(32),
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(20),
                          ),
                          Image.asset(
                            "assets/images/detail/icon_gxsj.png",
                            height: ScreenAdaper.setWidth(35),
                            width: ScreenAdaper.setWidth(35),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(10),
                          ),
                          Text(
                            DateUtils.instance.getFormartData(
                                timeSamp: widget.model.vodTimeAdd,
                                format: "yyyy-MM-dd"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(32),
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(20),
                          ),
                          Image.asset(
                            "assets/images/detail/icon_play_num.png",
                            height: ScreenAdaper.setWidth(35),
                            width: ScreenAdaper.setWidth(35),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(10),
                          ),
                          Text(
                            widget.model.vodHits.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(32),
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DetailWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
