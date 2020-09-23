import 'package:balon_movie/common/utils/date_format.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:balon_movie/widget/detail/detail_tag.dart';
import 'package:balon_movie/widget/detail/detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key key,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  HomeRecommendModel model;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  List tagList; //标签
  String url; //视频路径

  final lightColor = Color.fromRGBO(255, 255, 255, 0.85);
  final darkColor = Color.fromRGBO(1, 1, 1, 0.35);

  @override
  void initState() {
    super.initState();
    model = Provider.of<VideoProvider>(context, listen: false).getModel();
    url = model.vodPlayUrl.replaceAll("第一集\$", "");
    //控制器初始化
    _initController();
    if (model.vodTag == "") {
      tagList = [];
    } else {
      tagList = model.vodTag.trim().split(",");
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  void _initController() {
    videoPlayerController = VideoPlayerController.network(url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      showControls: true,
      placeholder: Container(
        color: Colors.black,
      ),
      // 是否在 UI 构建的时候就加载视频
      autoInitialize: true,
      // 拖动条样式颜色
      materialProgressColors: ChewieProgressColors(
        playedColor: lightColor,
        handleColor: lightColor,
        bufferedColor: Colors.white30,
        backgroundColor: darkColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdaper.init(context);
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
              child: Chewie(
                controller: chewieController,
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
                        model.vodName,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenAdaper.setSp(
                            46,
                            allowFontScalingSelf: false,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenAdaper.setWidth(15),
                        ScreenAdaper.setWidth(15),
                        0,
                        ScreenAdaper.setWidth(20),
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenAdaper.setWidth(30),
                      ),
                      height: ScreenAdaper.setHeight(50),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/detail/icon_pf.png",
                            height: ScreenAdaper.setWidth(38),
                            width: ScreenAdaper.setWidth(38),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(5),
                          ),
                          Text(
                            model.vodScore.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(35),
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(20),
                          ),
                          Image.asset(
                            "assets/images/detail/icon_gxsj.png",
                            height: ScreenAdaper.setWidth(38),
                            width: ScreenAdaper.setWidth(38),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(10),
                          ),
                          Text(
                            DateUtils.instance.getFormartData(
                                timeSamp: model.vodTimeAdd,
                                format: "yyyy-MM-dd"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(35),
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(20),
                          ),
                          Image.asset(
                            "assets/images/detail/icon_play_num.png",
                            height: ScreenAdaper.setWidth(38),
                            width: ScreenAdaper.setWidth(38),
                          ),
                          SizedBox(
                            width: ScreenAdaper.setWidth(10),
                          ),
                          Text(
                            model.vodHits.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdaper.setSp(35),
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DetailWidget(),
                    DetailTag(tags: tagList),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        ScreenAdaper.setWidth(20),
                        ScreenAdaper.setWidth(40),
                        ScreenAdaper.setWidth(20),
                        ScreenAdaper.setWidth(40),
                      ),
                      child: Image.asset("assets/images/home/banner_look.png"),
                    ),
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
