import 'dart:math';

import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/dao/category_dao.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:balon_movie/widget/detail/detail_recommend.dart';
import 'package:balon_movie/widget/detail/detail_tag.dart';
import 'package:balon_movie/widget/detail/detail_title.dart';
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

  HomeRecommendModel model; //当前打开视频的数据模型
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  List tagList = []; //标签列表
  String firstTag = "欧美"; //第一个标签，用于推荐
  String url; //视频路径
  List<HomeRecommendModel> recommendList = []; //推荐视频列表

  final lightColor = Color.fromRGBO(255, 255, 255, 0.85);
  final darkColor = Color.fromRGBO(1, 1, 1, 0.35);

  @override
  void initState() {
    super.initState();
    //数据初始化
    _initTag();
    //推荐视频数据请求
    _loadRecommend();
    //控制器初始化
    _initController();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Future<Null> _loadRecommend() async {
    await CategoryDao.getCategoryRecommend(tag: firstTag).then((value) {
      setState(() {
        this.recommendList = value;
      });
    });
  }

  void _initTag() {
    model = Provider.of<VideoProvider>(context, listen: false).getModel();

    if (model.vodTag == "") {
      tagList = ["推荐"];
    } else {
      tagList = model.vodTag.trim().split(",");
      firstTag = tagList[0];
    }
    url = model.vodPlayUrl.replaceAll("第一集\$", "");
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
                    DetailTitle(),
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
                    DetailRecommend(list: recommendList)
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
