import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/provider/video_provider.dart';
import 'package:balon_movie/routers/application.dart';
import 'package:balon_movie/widget/detail/detail_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRecommend extends StatelessWidget {
  final List<HomeRecommendModel> list;
  const DetailRecommend({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Column(
      children: [
        _title(),
        Padding(
          padding: EdgeInsets.all(
            ScreenAdaper.setWidth(12),
          ),
          child: _wrapList(context),
        )
      ],
    );
  }

  Widget _title() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: ScreenAdaper.setHeight(40),
              margin: EdgeInsets.only(right: ScreenAdaper.setWidth(20)),
              child: Image.asset(
                "assets/images/detail/icon_cnxh.png",
                width: ScreenAdaper.setWidth(40),
                height: ScreenAdaper.setHeight(40),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "猜你喜欢",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenAdaper.setSp(48),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _wrapList(BuildContext context) {
    if (list.length > 0) {
      List<Widget> listWidget = list.map((i) {
        return GestureDetector(
          onTap: () {
            Provider.of<VideoProvider>(context, listen: false).updateModel(i);
            Application.router.navigateTo(
              context,
              "/detail",
              transition: TransitionType.fadeIn,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(
              ScreenAdaper.setWidth(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: ScreenAdaper.setHeight(330),
                  padding: EdgeInsets.only(
                    right: ScreenAdaper.setWidth(20),
                  ),
                  width: ScreenAdaper.setWidth(550),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: AspectRatio(
                      aspectRatio: 1.42,
                      child: CachedNetworkImage(
                        imageUrl: i.vodPic,
                        placeholder: (context, url) => Image.asset(
                            "assets/images/global/outline.png",
                            fit: BoxFit.fill),
                        errorWidget: (context, url, error) => Image.asset(
                            "assets/images/no_banner.png",
                            fit: BoxFit.fill),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: ScreenAdaper.setHeight(110),
                        child: Text(
                          i.vodName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenAdaper.setSp(40),
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenAdaper.setHeight(180),
                        padding: EdgeInsets.only(
                          top: ScreenAdaper.setHeight(20),
                          bottom: ScreenAdaper.setHeight(20),
                        ),
                        child: DetailTag(
                          tags:
                              i.vodTag == "" ? [] : i.vodTag.trim().split(","),
                          tagNum: 4,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: ScreenAdaper.setHeight(40),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/detail/icon_like_dz.png",
                              height: ScreenAdaper.setWidth(38),
                              width: ScreenAdaper.setWidth(38),
                            ),
                            SizedBox(
                              width: ScreenAdaper.setWidth(10),
                            ),
                            Text(
                              i.vodUp.toString(),
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
                              i.vodHits.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ScreenAdaper.setSp(35),
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 1,
        children: listWidget,
      );
    } else {
      return Center(
        child: Text(
          "暂无推荐...",
          style:
              TextStyle(fontSize: ScreenAdaper.setSp(38), color: Colors.white),
        ),
      );
    }
  }
}
