import 'dart:async';
import 'package:balon_movie/common/utils/date_format.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/widget/detail/detail_tag.dart';
import 'package:balon_movie/widget/detail/detail_widget.dart';
import 'package:balon_movie/widget/tencent_player/tencent_player_bottom_widget.dart';
import 'package:balon_movie/widget/tencent_player/tencent_player_gesture_cover.dart';
import 'package:balon_movie/widget/tencent_player/tencent_player_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tencentplayer/flutter_tencentplayer.dart';

enum PlayType {
  network,
  asset,
  file,
  fileId,
}

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  final HomeRecommendModel model;
  PlayType playType;
  String dataSource;

  //UI
  bool showBottomWidget;
  bool showClearBtn;

  DetailPage(
      {Key key,
      @required this.model,
      this.showBottomWidget = true,
      this.showClearBtn = true,
      this.dataSource,
      this.playType = PlayType.network})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List tagList; //标签
  TencentPlayerController controller;
  VoidCallback listener;
  DeviceOrientation deviceOrientation;

  bool isLock = false;
  bool showCover = false;
  Timer timer;

  _DetailPageState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  @override
  void initState() {
    super.initState();

    widget.dataSource = widget.model.vodPlayUrl.replaceAll("第一集\$", "");
    if (widget.model.vodTag == "") {
      tagList = [];
    } else {
      tagList = widget.model.vodTag.trim().split(",");
    }

    // SystemChrome.setEnabledSystemUIOverlays([]); //隐藏状态栏
    _initController();
    controller.initialize();
    controller.addListener(listener);
    hideCover();
    //ForbidShotUtil.initForbid(context); //阻止ios和android捕获和录制屏幕
    // Screen.keepOn(true);
  }

  @override
  // ignore: missing_return
  Future dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  _initController() {
    switch (widget.playType) {
      case PlayType.network:
        controller = TencentPlayerController.network(widget.dataSource);
        break;
      case PlayType.asset:
        controller = TencentPlayerController.asset(widget.dataSource);
        break;
      case PlayType.file:
        controller = TencentPlayerController.file(widget.dataSource);
        break;
      case PlayType.fileId:
        controller = TencentPlayerController.network(null,
            playerConfig: PlayerConfig(
                auth: {"appId": 1252463788, "fileId": widget.dataSource}));
        break;
    }
  }

  hideCover() {
    if (!mounted) return;
    setState(() {
      showCover = !showCover;
    });
    delayHideCover();
  }

  delayHideCover() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    if (showCover) {
      timer = new Timer(Duration(seconds: 3), () {
        if (!mounted) return;
        setState(() {
          showCover = false;
        });
      });
    }
  }

  List<String> clearUrlList = [
    'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f10.mp4',
    'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f20.mp4',
    'http://1252463788.vod2.myqcloud.com/95576ef5vodtransgzp1252463788/e1ab85305285890781763144364/v.f30.mp4',
  ];

  changeClear(int urlIndex, {int startTime}) {
    controller?.removeListener(listener);
    controller?.pause();
    controller = TencentPlayerController.network(clearUrlList[urlIndex],
        playerConfig: PlayerConfig(
            startTime: startTime ?? controller.value.position.inSeconds));
    controller?.initialize()?.then((_) {
      if (mounted) setState(() {});
    });
    controller?.addListener(listener);
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
            GestureDetector(
              behavior: HitTestBehavior.opaque, //阻挡下一层元素获得事件
              onTap: () {
                hideCover();
              },
              onDoubleTap: () {
                if (!widget.showBottomWidget || isLock) return;
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              },
              child: Container(
                color: Colors.black,
                height: ScreenAdaper.setHeight(510),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    /// 视频
                    controller.value.initialized
                        ? AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: TencentPlayer(controller),
                          )
                        : Image.asset(
                            'assets/images/tencentplayer/place_nodata.png'),

                    /// 支撑全屏
                    Container(),

                    /// 半透明浮层
                    showCover
                        ? Container(color: Colors.transparent)
                        : SizedBox(),

                    /// 处理滑动手势
                    Offstage(
                      offstage: isLock,
                      child: TencentPlayerGestureCover(
                        controller: controller,
                        showBottomWidget: widget.showBottomWidget,
                        behavingCallBack: delayHideCover,
                      ),
                    ),

                    /// 加载loading
                    TencentPlayerLoading(
                      controller: controller,
                      iconW: ScreenAdaper.setWidth(153),
                    ),

                    /// 头部浮层
                    !isLock && showCover
                        ? Positioned(
                            top: 0,
                            left: ScreenAdaper.setWidth(8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: ScreenAdaper.setHeight(100),
                                  left: ScreenAdaper.setWidth(12),
                                ),
                                child: Image.asset(
                                  'assets/images/tencentplayer/icon_back.png',
                                  width: ScreenAdaper.setWidth(64),
                                  height: ScreenAdaper.setWidth(64),
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),

                    /// 锁
                    showCover
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                setState(() {
                                  isLock = !isLock;
                                });
                                delayHideCover();
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top,
                                  right: ScreenAdaper.setWidth(20),
                                  bottom: ScreenAdaper.setHeight(20),
                                  left: 0,
                                ),
                                child: Image.asset(
                                  isLock
                                      ? 'assets/images/tencentplayer/player_lock.png'
                                      : 'assets/images/tencentplayer/player_unlock.png',
                                  width: ScreenAdaper.setWidth(88),
                                  height: ScreenAdaper.setWidth(88),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),

                    /// 进度、清晰度、速度
                    Offstage(
                      offstage: !widget.showBottomWidget,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).padding.top,
                            right: MediaQuery.of(context).padding.bottom),
                        child: TencentPlayerBottomWidget(
                          isShow: !isLock && showCover,
                          controller: controller,
                          showClearBtn: widget.showClearBtn,
                          behavingCallBack: () {
                            delayHideCover();
                          },
                          changeClear: (int index) {
                            changeClear(index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
                            widget.model.vodScore.toString(),
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
                                timeSamp: widget.model.vodTimeAdd,
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
                            widget.model.vodHits.toString(),
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
